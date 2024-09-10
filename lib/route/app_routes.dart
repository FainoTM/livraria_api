import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livraria_app_api/view/home_page.dart';
import 'package:livraria_app_api/view/detail_page.dart';

import '../model/book_model.dart';

class AppRoute {
  static const homepage = '/';
  static const detailpage = '/detail';

  static List<GetPage> define() {
    return [
      GetPage(name: homepage, page: () => HomePage()),
      GetPage(
        name: detailpage,
        page: () {
          final Book book =
              Get.arguments; // Recebe o argumento passado para a rota
          return DetailPage(book: book);
        },
      ),
    ];
  }
}
