import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/CitiesModel/cities_model.dart';
import 'package:code/src/data/models/JobTitlesModel/job_titles_model.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';


class CustomJobTitlesDropDown extends StatefulWidget {
  String? hint;

  CustomJobTitlesDropDown({this.hint});
  @override
  _CustomJobTitlesDropDownState createState() => _CustomJobTitlesDropDownState();
}

class _CustomJobTitlesDropDownState extends State<CustomJobTitlesDropDown> {
  final _formKey = GlobalKey<FormState>();
  List<JobTitle> job_titles_list = [];
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: DropdownSearch<JobTitle>(
          asyncItems: (filter) => getData(filter),
          compareFn: (i, s) => i.isEqual(s),
          onChanged: (JobTitle){
            sharedPreferenceManager.writeData(CachingKey.JOB_TITLE_ID, JobTitle!.id);
            sharedPreferenceManager.writeData(CachingKey.JOB_TITLE_NAME_AR, JobTitle.name);
            sharedPreferenceManager.writeData(CachingKey.JOB_TITLE_NAME_EN, JobTitle.nameEn);
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


  Widget _customPopupItemBuilder(BuildContext context, JobTitle? item, bool isSelected,) {

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

  Future<List<JobTitle>> getData(filter) async {
    if(job_titles_list.isEmpty){
      var response = await Dio().get(
          baseUrl + getAllJobTitlesUrl
      );


      final data = response.data['data'];
      if (data != null) {
        job_titles_list = JobTitle.fromJsonList(data);
        return JobTitle.fromJsonList(data);
      }

      return [];
    }else{
      return job_titles_list.where((element) => element.name!.contains(filter)).toList();
    }

  }
}

