import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/CitiesModel/cities_model.dart';
import 'package:code/src/data/models/JobTitlesModel/job_titles_model.dart';
import 'package:code/src/data/models/ProvincesModel/provinces_model.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';


class CustomProvinceDropDown extends StatefulWidget {
  String? hint;

  CustomProvinceDropDown({this.hint});
  @override
  _CustomProvinceDropDownState createState() => _CustomProvinceDropDownState();
}

class _CustomProvinceDropDownState extends State<CustomProvinceDropDown> {
  final _formKey = GlobalKey<FormState>();
  List<Province> provinces_list = [];
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: DropdownSearch<Province>(
          asyncItems: (filter) => getData(filter),
          compareFn: (i, s) => i.isEqual(s),
          onChanged: (Province){
            sharedPreferenceManager.writeData(CachingKey.PROVINCE_ID, Province!.id);

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


  Widget _customPopupItemBuilder(BuildContext context, Province? item, bool isSelected,) {

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

  Future<List<Province>> getData(filter) async {
    if(provinces_list.isEmpty){
      var response = await Dio().get(
          baseUrl + getAllProvincesUrl
      );


      final data = response.data['data'];
      if (data != null) {
        provinces_list = Province.fromJsonList(data);
        return Province.fromJsonList(data);
      }

      return [];
    }else{
      return provinces_list.where((element) => element.name!.contains(filter)).toList();
    }

  }
}

