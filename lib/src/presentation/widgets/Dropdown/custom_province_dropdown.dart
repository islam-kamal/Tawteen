import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/CitiesModel/cities_model.dart';
import 'package:code/src/data/models/JobTitlesModel/job_titles_model.dart';
import 'package:code/src/data/models/ProvincesModel/provinces_model.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:dio/adapter.dart';

class CustomProvinceDropDown  extends StatefulWidget {
  String? hint;
 var province;
 bool ? isRegister;
  CustomProvinceDropDown({this.hint,this.province,this.isRegister=false});
  @override
  _CustomProvinceDropDownState createState() => _CustomProvinceDropDownState();
}

class _CustomProvinceDropDownState extends State<CustomProvinceDropDown> {
  final _formKey = GlobalKey<FormState>();
  List<Province> provinces_list = [];
  @override
  void initState() {
    if(widget.province != null){
      sharedPreferenceManager.writeData(CachingKey.PROVINCE_ID, Shared.profileModel!.provinceId);
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
        child: DropdownSearch<Province>(
          asyncItems: (filter) => getData(filter),
          compareFn: (i, s) =>  i.isEqual(s),
          itemAsString: (Province u) => u.userAsString(),

          onChanged: (Province){
            sharedPreferenceManager.writeData(CachingKey.PROVINCE_ID, Province!.id);
            var selectProvinceProvider = Provider.of<SelectProvinceProvider>(context, listen: false);
            selectProvinceProvider.change_cities_depend_region_status(
              status: true
            );
            if(!widget.isRegister!)
            Shared.profileModel!.provinceId = Province.id!;

          },
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              hintText: widget.province == null?  widget.hint! : widget.province ,
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
        selected:  isSelected,
        title:  Text((translator.activeLanguageCode == 'ar' ? item?.name : item!.nameEn) ?? '',style: TextStyle(
            color: isSelected ? kGreenColor : kBlackColor,
            fontFamily: "DINNextLTArabic"),),


      ),
    );
  }

  Future<List<Province>> getData(filter) async {
    if(provinces_list.isEmpty){
      Dio dio = new Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient dioClient) {
        dioClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
        return dioClient;
      };
      dio.options.headers["Accept-Language"] = translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG';
      var response = await dio.get(
          baseUrl + getAllProvincesUrl
      );


      final data = response.data['data'];
      if (data != null) {
        provinces_list = Province.fromJsonList(data);
        return Province.fromJsonList(data);
      }

      return [];
    }else{
      if(translator.activeLanguageCode == 'ar'){
        return provinces_list.where((element) => element.name!.contains(filter)).toList();
      }else{
        var x = provinces_list.where((element){
          if(element.nameEn != null)
            return element.nameEn!.contains(filter);
          else
            return false;
        }).toList();
        return x;
      }

      // return provinces_list.where((element) => element.name!.contains(filter)).toList();
    }

  }
}

class SelectProvinceProvider extends ChangeNotifier {
  bool? cities_depend_region_status = false;
  List<City> cities_list = [];

  void set_cities_list({ List<City>? cities}){
    cities_list = cities!;
    notifyListeners();
  }


  void change_cities_depend_region_status({bool? status}) {
    cities_depend_region_status = status;
    cities_list = [];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

}