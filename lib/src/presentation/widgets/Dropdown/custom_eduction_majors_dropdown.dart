import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/CitiesModel/cities_model.dart';
import 'package:code/src/data/models/EductionMajorModel/eduction_major_model.dart';
import 'package:code/src/data/models/JobTitlesModel/job_titles_model.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';


class CustomEductionMajorDropDown extends StatefulWidget {
  String? hint;

  CustomEductionMajorDropDown({this.hint});
  @override
  _CustomEductionMajorDropDownState createState() => _CustomEductionMajorDropDownState();
}

class _CustomEductionMajorDropDownState extends State<CustomEductionMajorDropDown> {
  final _formKey = GlobalKey<FormState>();
  List<EductionMajor> eduction_major_list = [];
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: DropdownSearch<EductionMajor>(
          asyncItems: (filter) => getData(filter),
          compareFn: (i, s) => i.isEqual(s),
          onChanged: (EductionMajor){
            sharedPreferenceManager.writeData(CachingKey.EDUCTION_MAJOR_ID, EductionMajor!.id);

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
      var response = await Dio().get(
          baseUrl + getEductionMajorUrl
      );


      final data = response.data['data'];
      if (data != null) {
        eduction_major_list = EductionMajor.fromJsonList(data);
        return EductionMajor.fromJsonList(data);
      }

      return [];
    }else{
      return eduction_major_list.where((element) => element.name!.contains(filter)).toList();
    }

  }
}

