import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/CitiesModel/cities_model.dart';
import 'package:code/src/data/models/EductionalLevelModel/eductional_level_model.dart';
import 'package:code/src/data/models/JobTitlesModel/job_titles_model.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';


class CustomEductionalLevelDropDown extends StatefulWidget {
  String? hint;

  CustomEductionalLevelDropDown({this.hint});
  @override
  _CustomEductionalLevelDropDownState createState() => _CustomEductionalLevelDropDownState();
}

class _CustomEductionalLevelDropDownState extends State<CustomEductionalLevelDropDown> {
  final _formKey = GlobalKey<FormState>();
  List<EductionalLevel> eductional_level_list = [];
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: DropdownSearch<EductionalLevel>(
          asyncItems: (filter) => getData(filter),
          compareFn: (i, s) => i.isEqual(s),
          onChanged: (EductionalLevel){
            sharedPreferenceManager.writeData(CachingKey.EDUCTIONAL_LEVEL_ID, EductionalLevel!.id);

          },
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              hintText: widget.hint!,
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
          popupProps: PopupPropsMultiSelection.menu(
            isFilterOnline: true,
            showSelectedItems: true,
            showSearchBox: true,
            fit: FlexFit.tight,
            itemBuilder: _customPopupItemBuilder,


          ),
        ),
      ),
    );
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
      var response = await Dio().get(
          baseUrl + getEductionalLevelUrl
      );


      final data = response.data['data'];
      if (data != null) {
        eductional_level_list = EductionalLevel.fromJsonList(data);
        return EductionalLevel.fromJsonList(data);
      }

      return [];
    }else{
      return eductional_level_list.where((element) => element.name!.contains(filter)).toList();
    }

  }

}

