import 'package:flutter/material.dart';
import 'package:livraria_app_api/view/home_page.dart';

class AppRoute {
  static const homepage = '/view/home_page';

  static Map<String, WidgetBuilder> define() {
    return {
      homepage: (BuildContext context) => HomePage(),
    };
  }
}
