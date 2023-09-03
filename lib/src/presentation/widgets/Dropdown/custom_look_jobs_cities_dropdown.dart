import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/CitiesModel/cities_model.dart';
import 'package:code/src/domain/entities/user_model.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class CustomLookJobsCitiesDropDown extends StatefulWidget {
  String? hint;
  bool? select_city_status;
  bool? cities_depend_region_status;
  String? city_name;
  CustomLookJobsCitiesDropDown({this.hint,this.select_city_status = false,this.city_name});
  @override
  _CustomLookJobsCitiesDropDownState createState() => _CustomLookJobsCitiesDropDownState();
}

class _CustomLookJobsCitiesDropDownState extends State<CustomLookJobsCitiesDropDown> {
  final _formKey = GlobalKey<FormState>();

  List<City> cities_list = [];
  @override
  void initState() {
    if(widget.city_name != null){
      sharedPreferenceManager.writeData(CachingKey.CITY_ID, Shared.profileModel!.cityId);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return   Padding(
        padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),

        child:Container(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: DropdownSearch<City>(
              asyncItems: (filter) => getData(filter),
              itemAsString: (City u) => u.userAsString(),
              compareFn: (i, s) => i.isEqual(s),
              onChanged: (city){
                Shared.searchSpecficJobsEntity.city_id = city!.id;
                sharedPreferenceManager.writeData(CachingKey.CITY_ID, city.id);
                sharedPreferenceManager.writeData(CachingKey.CITY_NAME_AR, city.name);
                sharedPreferenceManager.writeData(CachingKey.CITY_NAME_En, city.nameEn);

              },

              enabled: widget.select_city_status! ?  false : true,
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                 hintText: widget.select_city_status! ?
                  translator.activeLanguageCode == 'ar' ?
                  Shared.nafathInfoEntity!.city_name_ar :  Shared.nafathInfoEntity!.city_name_en
                      : widget.city_name == null ? widget.hint! : widget.city_name,
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

                itemBuilder: _customPopupItemBuilder,
              ),
            ),
          ),
        ));
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
    if(cities_list.isEmpty){
      Dio dio = new Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient dioClient) {
        dioClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
        return dioClient;
      };
      dio.options.headers["Accept-Language"] = translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG';
      var response = await dio.get(
          baseUrl + "api/v1/lookup/cities"
    );

    final data = response.data['data'];
    if (data != null) {
    cities_list = City.fromJsonList(data);
    return City.fromJsonList(data);
    }

    return [];
    }else{
      if(translator.activeLanguageCode == 'ar'){
        return cities_list.where((element) => element.name!.contains(filter)).toList();
      }else{
        var x = cities_list.where((element){
          if(element.nameEn != null)
          return element.nameEn!.contains(filter);
          else
            return false;
        }).toList();
        return x;
      }

    }

  }
}


