import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/CitiesModel/cities_model.dart';
import 'package:code/src/data/models/EductionMajorModel/eduction_major_model.dart';
import 'package:code/src/data/models/JobTitlesModel/job_titles_model.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
class CustomEductionMajorDropDown extends StatefulWidget {
  String? hint;
  String? eductionMajor;
  bool? isRegister;
  CustomEductionMajorDropDown({this.hint,this.eductionMajor,this.isRegister = false});
  @override
  _CustomEductionMajorDropDownState createState() => _CustomEductionMajorDropDownState();
}

class _CustomEductionMajorDropDownState extends State<CustomEductionMajorDropDown> {
  final _formKey = GlobalKey<FormState>();
  List<EductionMajor> eduction_major_list = [];
  @override
  Widget build(BuildContext context) {

    return  Padding(
        padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),
        child: Container(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: DropdownSearch<EductionMajor>(
          asyncItems: (filter) => getData(filter),
          compareFn: (i, s) => i.isEqual(s),
          itemAsString: (EductionMajor u) => u.userAsString(),

          onChanged: (eductionMajor){
            sharedPreferenceManager.writeData(CachingKey.EDUCTION_MAJOR_ID, eductionMajor!.id);
            if(!widget.isRegister!)
              Shared.profileModel!.educationMajorId = int.parse(eductionMajor.id!);

          },
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              hintText: widget.eductionMajor == null ?widget.hint! : widget.eductionMajor,
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


  Widget _customPopupItemBuilder(BuildContext context, EductionMajor? item, bool isSelected,) {

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

  Future<List<EductionMajor>> getData(filter) async {
    if(eduction_major_list.isEmpty){
      Dio dio = new Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient dioClient) {
        dioClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
        return dioClient;
      };
      dio.options.headers["Accept-Language"] = translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG';
      var response = await dio.get(
          baseUrl + getEductionMajorUrl
      );


      final data = response.data['data'];
      if (data != null) {
        eduction_major_list = EductionMajor.fromJsonList(data);
        return EductionMajor.fromJsonList(data);
      }

      return [];
    }else{
      if(translator.activeLanguageCode == 'ar'){
        return eduction_major_list.where((element) => element.name!.contains(filter)).toList();
      }else{
        var x = eduction_major_list.where((element){
          if(element.nameEn != null)
            return element.nameEn!.contains(filter);
          else
            return false;
        }).toList();
        return x;
      }

      //  return eduction_major_list.where((element) => element.name!.contains(filter)).toList();
    }

  }
}

