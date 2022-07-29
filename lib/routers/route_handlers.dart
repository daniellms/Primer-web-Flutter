// import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:vertical_landing_page/ui/pages/home_page.dart';

final homeHandler = Handler(handlerFunc: (context, params) {
  final page = params['page']!.first;
  // print(page);
  if( page != '/')
  return HomePage();
});
