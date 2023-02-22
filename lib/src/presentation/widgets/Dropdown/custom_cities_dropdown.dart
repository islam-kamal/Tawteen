import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/CitiesModel/cities_model.dart';
import 'package:code/src/domain/entities/user_model.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';


class CustomCitiesDropDown extends StatefulWidget {
  String? hint;
  String? route;
  CustomCitiesDropDown({this.hint,this.route});
  @override
  _CustomCitiesDropDownState createState() => _CustomCitiesDropDownState();
}

class _CustomCitiesDropDownState extends State<CustomCitiesDropDown> {
  final _formKey = GlobalKey<FormState>();
  final _popupBuilderKey = GlobalKey<DropdownSearchState<String>>();

  List<City> cities_list = [];
  @override
  Widget build(BuildContext context) {


    return Container(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: DropdownSearch<City>(
          asyncItems: (filter) => getData(filter),
          compareFn: (i, s) => i.isEqual(s),
          onChanged: (city){
            sharedPreferenceManager.writeData(CachingKey.CITY_ID, city!.id);
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

            itemBuilder: _customPopupItemBuilder,
          ),
        ),
      ),
    );
  }


  Widget _customPopupItemBuilder(BuildContext context, City? item, bool isSelected) {
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
        title:  Text((translator.activeLanguageCode == 'ar' ? item?.name : item!.nameEn) ?? '',
          style: TextStyle(
            color: isSelected ? kGreenColor : kBlackColor,
            fontFamily: "DINNextLTArabic"),),


      ),
    );
  }

  Future<List<City>> getData(filter) async {
  //  if(cities_list.isEmpty){
      var response = await Dio().get(
          baseUrl + "api/v1/lookup/cities?provinceId=${await sharedPreferenceManager.readString(CachingKey.PROVINCE_ID)}"
      );


      final data = response.data['data'];
      if (data != null) {
        cities_list = City.fromJsonList(data);
        return City.fromJsonList(data);
      }

      return [];
    /*}else{
      return cities_list.where((element) => element.name!.contains(filter)).toList();
    }*/

  }
}

