import 'package:flutter/material.dart';
import 'package:livraria_app_api/route/app_routes.dart';
import 'package:livraria_app_api/view/home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
    initialRoute: AppRoute.homepage,
    routes: AppRoute.define(),
  ));
}
