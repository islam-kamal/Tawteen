// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/presentation/pages/Courses/course_details_screen.dart';
import 'package:code/src/presentation/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';


class CourseWebView extends StatefulWidget {
  CourseEntity? courseEntity;
  CourseWebView({this.courseEntity});


  @override
  State<CourseWebView> createState() => _CourseWebViewState();
}

class _CourseWebViewState extends State<CourseWebView> {
  WebViewController? _webController;



  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: translator.activeLanguageCode == 'ar'
            ? TextDirection.rtl
            : TextDirection.ltr,
        child:Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBarWidget.appBarWidget(
          context: context, icon: true, route: CourseDetailsScreen(
        courseEntity: widget.courseEntity,
      )),
      body:        Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: WebView(
          debuggingEnabled: false,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            _webController = controller;
            _webController!.loadUrl(
             widget.courseEntity!.course_url!
            );
          },
          onPageFinished: (page) async {
            print("page : ${page}");
          },
        ),
      ),

    ));
  }


}
