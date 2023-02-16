import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/domain/entities/user_model.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';


class CustomDropDown extends StatefulWidget {
  String? hint;
  CustomDropDown({this.hint});
  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  final _formKey = GlobalKey<FormState>();
  final _popupBuilderKey = GlobalKey<DropdownSearchState<String>>();

  bool? _popupBuilderSelection = false;

  @override
  Widget build(BuildContext context) {
    void _handleCheckBoxState({bool updateState = true}) {
      var selectedItem =
          _popupBuilderKey.currentState?.popupGetSelectedItems ?? [];
      var isAllSelected =
          _popupBuilderKey.currentState?.popupIsAllItemSelected ?? false;
      _popupBuilderSelection =
      selectedItem.isEmpty ? false : (isAllSelected ? true : null);

      if (updateState) setState(() {});
    }

    _handleCheckBoxState(updateState: false);

    return Container(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: DropdownSearch<UserModel>(
          asyncItems: (filter) => getData(filter),
          compareFn: (i, s) => i.isEqual(s),
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


  Widget _customPopupItemBuilder(BuildContext context, UserModel? item, bool isSelected,) {
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
        title:  Text(item?.name ?? '',style: TextStyle(
            color: isSelected ? kGreenColor : kBlackColor,
        fontFamily: "DINNextLTArabic"),),


      ),
    );
  }

  Future<List<UserModel>> getData(filter) async {
    var response = await Dio().get(
      "https://5d85ccfb1e61af001471bf60.mockapi.io/user",
      queryParameters: {"filter": filter},
    );

    final data = response.data;
    if (data != null) {
      return UserModel.fromJsonList(data);
    }

    return [];
  }
}

