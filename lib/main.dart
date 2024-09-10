import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livraria_app_api/route/app_routes.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppRoute.homepage,
    getPages: AppRoute.define(),
  ));
}
