import 'dart:ffi';

import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/CitiesModel/cities_model.dart';
import 'package:code/src/data/models/JobTitlesModel/job_titles_model.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class CustomJobTitlesDropDown extends StatefulWidget {
  String? hint;
  bool? isRegister;
  bool? main_jobtitle_id;

  CustomJobTitlesDropDown({this.hint,this.isRegister= false,this.main_jobtitle_id = false});
  @override
  _CustomJobTitlesDropDownState createState() => _CustomJobTitlesDropDownState();
}

class _CustomJobTitlesDropDownState extends State<CustomJobTitlesDropDown> {
  final _formKey = GlobalKey<FormState>();
  List<JobTitle> job_titles_list = [];
  @override
  Widget build(BuildContext context) {

    return     Padding(
        padding: EdgeInsets.symmetric(vertical: Shared.width * 0.02,horizontal:  Shared.width * 0.03),
        child:Container(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: DropdownSearch<JobTitle>(
          asyncItems: (filter) => getData(filter),
          compareFn: (i, s) => i.isEqual(s),
          itemAsString: (JobTitle u) => u.userAsString(),
          onChanged: (JobTitle){
            Shared.searchSpecficJobsEntity.jobTitleId = JobTitle!.id;

            sharedPreferenceManager.writeData(CachingKey.JOB_TITLE_ID, JobTitle.id);
            sharedPreferenceManager.writeData(CachingKey.JOB_TITLE_NAME_AR, JobTitle.name);
            sharedPreferenceManager.writeData(CachingKey.JOB_TITLE_NAME_EN, JobTitle.nameEn);
            if(!widget.isRegister!)
              Shared.profileModel!.jobTitleId = JobTitle.id;
            else if(widget.main_jobtitle_id!){
              sharedPreferenceManager.writeData(CachingKey.MAIN_JOB_TITLE_ID, JobTitle.id);
            }
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
      Dio dio = new Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient dioClient) {
        dioClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
        return dioClient;
      };
      dio.options.headers["Accept-Language"] = translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG';
      var response = await dio.get(
          baseUrl + getAllJobTitlesUrl,
      );


      final data = response.data['data'];
      if (data != null) {
        job_titles_list = JobTitle.fromJsonList(data);
        return JobTitle.fromJsonList(data);
      }

      return [];
    }else{
      if(translator.activeLanguageCode == 'ar'){
        return job_titles_list.where((element) => element.name!.contains(filter)).toList();
      }else{
        var x = job_titles_list.where((element){
          if(element.nameEn != null)
            return element.nameEn!.contains(filter);
          else
            return false;
        }).toList();
        return x;
      }



      // return job_titles_list.where((element) => element.name!.contains(filter)).toList();
    }

  }
}

