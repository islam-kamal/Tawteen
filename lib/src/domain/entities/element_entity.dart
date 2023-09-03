import 'package:flutter/cupertino.dart';

class ElementEntity{
  String? image;
  String? title;
  Widget? screen;
  Function()? function;
  ElementEntity({this.title,this.image,this.screen,this.function});
}