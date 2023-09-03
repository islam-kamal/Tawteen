import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/CitiesModel/cities_model.dart';
import 'package:code/src/data/models/EductionalLevelModel/eductional_level_model.dart';
import 'package:code/src/data/models/JobTitlesModel/job_titles_model.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class CustomEductionalLevelDropDown extends StatefulWidget {
  String? hint;
  String? eductionalLevel;
  bool? isRegister;
  CustomEductionalLevelDropDown({this.hint,this.eductionalLevel,this.isRegister = false});
  @override
  _CustomEductionalLevelDropDownState createState() => _CustomEductionalLevelDropDownState();
}

class _CustomEductionalLevelDropDownState extends State<CustomEductionalLevelDropDown> {
  final _formKey = GlobalKey<FormState>();
  List<EductionalLevel> eductional_level_list = [];
  @override
  Widget build(BuildContext context) {

    return  Padding(
        padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),
        child: Container(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: DropdownSearch<EductionalLevel>(
          asyncItems: (filter) => getData(filter),
          compareFn: (i, s) => i.isEqual(s),
          itemAsString: (EductionalLevel u) => u.userAsString(),

          onChanged: (EductionalLevel){
            sharedPreferenceManager.writeData(CachingKey.EDUCTIONAL_LEVEL_ID, EductionalLevel!.id);
         //   if(widget.eductionalLevel != null )
            if(!widget.isRegister!){
              sharedPreferenceManager.writeData(CachingKey.EDUCTIONAL_LEVEL_ID, EductionalLevel.id);
              Shared.profileModel!.educationLevel =
              translator.activeLanguageCode =='ar' ? EductionalLevel.name! : EductionalLevel.nameEn;

            }


        //    Shared.profileModel!.educationLevel = EductionalLevel.id;
          },
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              hintText: widget.eductionalLevel == null ?widget.hint! : widget.eductionalLevel,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
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
          dropdownButtonProps: DropdownButtonProps(
              color: kGreenColor
          ),

          popupProps: PopupPropsMultiSelection.menu(
            isFilterOnline: true,
            showSelectedItems: true,
            showSearchBox: true,
            fit: FlexFit.tight,
            itemBuilder: _customPopupItemBuilder,


          ),
        ),
      ),
    ));
  }


  Widget _customPopupItemBuilder(BuildContext context, EductionalLevel? item, bool isSelected,) {

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
        selected: isSelected,
        title:  Text((translator.activeLanguageCode == 'ar' ? item?.name : item!.nameEn) ?? '',style: TextStyle(
            color: isSelected ? kGreenColor : kBlackColor,
            fontFamily: "DINNextLTArabic"),),


      ),
    );
  }

  Future<List<EductionalLevel>> getData(filter) async {
    if(eductional_level_list.isEmpty){
      Dio dio = new Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient dioClient) {
        dioClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
        return dioClient;
      };
      dio.options.headers["Accept-Language"] = translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG';
      var response = await dio.get(
          baseUrl + getEductionalLevelUrl
      );


      final data = response.data['data'];
      if (data != null) {
        eductional_level_list = EductionalLevel.fromJsonList(data);
        return EductionalLevel.fromJsonList(data);
      }

      return [];
    }else{
      if(translator.activeLanguageCode == 'ar'){
        return eductional_level_list.where((element) => element.name!.contains(filter)).toList();
      }else{
        var x = eductional_level_list.where((element){
          if(element.nameEn != null)
            return element.nameEn!.contains(filter);
          else
            return false;
        }).toList();
        return x;
      }

      //  return eductional_level_list.where((element) => element.name!.contains(filter)).toList();
    }

  }

}

