import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/ProfileModel/profile_skills_model.dart';
import 'package:code/src/data/models/SkillsModel/skills_model.dart';
import 'package:code/src/domain/entities/user_model.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
class CustomSkillsDropdown extends StatefulWidget {
  String? hint;
  bool? isProfie ;
  CustomSkillsDropdown({this.hint,this.isProfie = false});
  @override
  _CustomSkillsDropdownState createState() => _CustomSkillsDropdownState();
}

class _CustomSkillsDropdownState extends State<CustomSkillsDropdown> {
  final _formKey = GlobalKey<FormState>();

  final _popupBuilderKey = GlobalKey<DropdownSearchState<String>>();


  bool? _popupBuilderSelection = false;
  List<Skills> skills_list = [];

  @override
  Widget build(BuildContext context) {
    void _handleCheckBoxState({bool updateState = true}) {
      var selectedItem =
          _popupBuilderKey.currentState?.popupGetSelectedItems ?? [];
      var isAllSelected =
          _popupBuilderKey.currentState?.popupIsAllItemSelected ?? false;
      _popupBuilderSelection =
      selectedItem.isEmpty ? false : (isAllSelected ? true : null);

      if (updateState) setState(() {});
    }

    _handleCheckBoxState(updateState: false);

    return   Padding(
        padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),
    child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: DropdownSearch<Skills>.multiSelection(
            asyncItems: (filter) => getData(filter),
            compareFn: (i, s) => i.isEqual(s),
            itemAsString: (Skills u) => u.userAsString(),

            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                hintText: widget.hint!,
                contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: kInactiveColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kInactiveColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kInactiveColor),
                  borderRadius: BorderRadius.circular(5),
                ),

              ),

            ),
            popupProps: PopupPropsMultiSelection.menu(
              showSearchBox: true,
              itemBuilder: _customPopupItemBuilder,
              favoriteItemProps: FavoriteItemProps(
                showFavoriteItems: true,
                favoriteItems: (us) {
                  List<Skills> Favorite_list = [];
                  skills_list.forEach((element) {
                    Shared.profileSkills!.forEach((e) {
                      if(element.id.toString() == e.skillId.toString()){
                        Favorite_list.add(element);
                      }
                    });
                  });
                   // return skills_list.where((e) => e.id.toString() == Shared.profileSkills![0].skillId.toString() ).toList();
              return Favorite_list;
                },
                favoriteItemBuilder: (context, item, isSelected) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[100]),
                    child: Row(
                      children: [
                        Text(
                          "${item.name}",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.indigo),
                        ),
                        Padding(padding: EdgeInsets.only(left: 8)),
                        isSelected ? Icon(Icons.check_box_outlined) : SizedBox.shrink(),
                      ],
                    ),
                  );
                },
              ),

              onItemRemoved: (selectedItems, removedItem) {
                setState(() {
                  if(widget.isProfie!){
                    Shared.profileSkills!.remove(removedItem);
                    print(" Shared.profileSkills! : ${ Shared.profileSkills!}");
                  }else{
                    Shared.applicant_skills.remove(removedItem);
                    print(" Shared.applicant_skills! : ${ Shared.applicant_skills}");
                  }

                });
              },
            ),
            dropdownButtonProps: DropdownButtonProps(
              color: kGreenColor
            ),

            onChanged: (item){
              if(widget.isProfie!){
                item.forEach((element) async {
                  Shared.profileSkills!.add(ProfileSkills(
                      applicantId: await sharedPreferenceManager.readInt(CachingKey.APPLICANT_ID),
                      skillId: int.parse(element.id!),
                      name: element.name,
                      nameEn: element.nameEn
                  ));
                });
              }else{
                item.forEach((element) async {
                  Shared.applicant_skills.add(element.id!);
                });
              }


            },

          )
    )  );
  }

  Widget _customPopupItemBuilder(BuildContext context, Skills? item, bool isSelected,) {

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
        border: Border.all(color: kGreenColor),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: ListTile(
        selected:  isSelected,
        title:   Text(item?.name ?? '',style: TextStyle(
            color: isSelected ? kGreenColor : kBlackColor,
            fontFamily: "DINNextLTArabic"),),

      ),
    );
  }



  Future<List<Skills>> getData(filter) async {
    if(skills_list.isEmpty){
      Dio dio = new Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient dioClient) {
        dioClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
        return dioClient;
      };
      dio.options.headers["Accept-Language"] = translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG';
      var response = await dio.get(
          baseUrl + getSkillsUrl
      );


      final data = response.data['data'];
      if (data != null) {
        skills_list = Skills.fromJsonList(data);
        return Skills.fromJsonList(data);
      }

      return [];
    }else{
      if(translator.activeLanguageCode == 'ar'){
        return skills_list.where((element) => element.name!.contains(filter)).toList();
      }else{
        var x = skills_list.where((element){
          if(element.nameEn != null)
            return element.nameEn!.contains(filter);
          else
            return false;
        }).toList();
        return x;
      }



      //return skills_list.where((element) => element.name!.contains(filter)).toList();
    }

  }


}

