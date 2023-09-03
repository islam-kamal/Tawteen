import 'package:code/src/Base/common/local_const.dart';
import 'package:code/src/Base/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatefulWidget {
  String? lablel;
  Widget? icon;
  Widget? sufficIcon;
  Color? filledColor;
  bool isMobile;
  TextAlign? alignment;
  TextEditingController? controller;
  String? errorMessage;
  String? hint;

  bool hasPassword;
  bool isEmail;
  bool? passwordIdentical;
  bool isPhoneCode;
  bool isFinal;
  bool isEditable;
  bool isNotes;
  bool hasBorder;
  bool? identity;
  bool? isQuantity;
  TextDirection? direction;
  GlobalKey<FormState>? formKey;
  bool? isProfile;
  bool? isValidator;

  FocusNode? focusNode;

  CustomTextField(
      {this.icon,
        this.lablel,
        this.filledColor,
        this.formKey,
        this.focusNode,
        this.isValidator = true,
        this.hasBorder = true,
        this.isEditable = true,
        this.isNotes = false,
        this.alignment,
        this.isFinal = false,
        this.isPhoneCode = false,
        this.isMobile = false,
        this.isEmail = false,
        this.passwordIdentical,
        this.hasPassword = false,
        this.controller,
        this.sufficIcon,
        this.errorMessage = '',
        this.isQuantity,
        this.direction,
        this.identity= false,
        this.hint,
        this.isProfile});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.isValidator!
          ? (value) {
        if (value == null || value.isEmpty) {
          return widget.errorMessage!.isEmpty
              ? null
              : translator.translate(widget.errorMessage!);
        }
        else {
          if (widget.isMobile) {
            Pattern pattern = r'^(009665|009715|00965|9665|9715|\+9665||\+9715|\+9655|05|5)(5|0|3|6|4|9|1|8|7|2)([0-9]{7})?$';
            RegExp regex = new RegExp(pattern.toString());
            if (!regex.hasMatch(value) || value.length <9) {
              return kEnter_the_phone_correctly.tr();
            } else {
              if (!value.startsWith(RegExp(
                  r'(009665|009715|00965|9665|9715|\+9665||\+9715|\+965|05|5)'))) {
                value = "00966" + value;
                print("value : ${value}");
                return value;
              }
            }
          }
          else if(widget.identity!){
            print("7");
            Pattern pattern = r'^1\d{9}$';
            RegExp regex = new RegExp(pattern.toString());
            print("value : ${value}");
            print("regx : ${regex.hasMatch(value) }");
            if (!regex.hasMatch(value) ) {
              print("8");
              return kEnter_the_identity.tr();
            }else{
              print("9");
              return null;
            }

          }else{
            print("10");
            return null;
          }


        }
      }

          : (value) {},
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      enabled: widget.isEditable,
      onEditingComplete: () {
        widget.formKey!.currentState!.validate();
      },

      focusNode: widget.focusNode,
      autofocus: false,
      obscureText: (widget.hasPassword) ? showPassword : widget.hasPassword,
      maxLines: (widget.isNotes) ? 3 : 1,
      textAlign: widget.alignment! ,
      keyboardType: (widget.isEmail)
          ? TextInputType.emailAddress
          : (widget.isMobile || widget.identity!)
          ? TextInputType.number
          : TextInputType.text,
      inputFormatters: (widget.isMobile || widget.identity!)
          ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
          : null,
      decoration: InputDecoration(
        floatingLabelBehavior: (widget.isNotes)
            ? FloatingLabelBehavior.never
            : FloatingLabelBehavior.auto,
        hintText: widget.hint,
        hintStyle: TextStyle(fontSize: 14,color: kGreyColor),
        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 5.0,),
        border: (!widget.hasBorder)
            ? InputBorder.none
            : OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                color: kInactiveColor)),
        focusedBorder: (!widget.hasBorder)
            ? InputBorder.none
            : OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: kInactiveColor)),

        enabledBorder: (!widget.hasBorder)
            ? InputBorder.none
            : OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: kInactiveColor)),

        prefixIcon: widget.icon,
        suffixIcon: widget.sufficIcon,
        fillColor: (widget.filledColor == null) ? Colors.white : widget.filledColor,
        filled: true,

      ),
    );
  }
}
