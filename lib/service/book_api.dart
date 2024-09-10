import 'package:dio/dio.dart';
import 'package:livraria_app_api/model/book_model.dart';

class BookApi {
  final Dio dio = Dio();
  final String apiKey = '';

  Future<List<String>> getLists() async {
    try {
      final response = await dio.get(
          'https://api.nytimes.com/svc/books/v3/lists/overview.json?api-key=$apiKey');
      if (response.statusCode == 200) {
        List<dynamic> lists = response.data['results']['lists'];
        List<String> listNames =
            lists.map((list) => list['list_name'] as String).toList();
        return listNames;
      } else {
        throw Exception('Falha ao carregar as listas');
      }
    } catch (e) {
      throw Exception('Erro ao buscar listas: $e');
    }
  }

  Future<List<Book>> getBooks(String listName) async {
    try {
      final response = await dio.get(
          'https://api.nytimes.com/svc/books/v3/lists/overview.json?api-key=$apiKey');
      if (response.statusCode == 200) {
        List<dynamic> lists = response.data['results']['lists'];
        var selectedList =
            lists.firstWhere((list) => list['list_name'] == listName);
        List<dynamic> booksData = selectedList['books'];

        List<Book> books = (booksData)
            .map((bookdata) => Book.fromJson(bookdata as Map<String, dynamic>))
            .toList();
        return books;
      } else {
        throw Exception('Falha ao carregar os livros');
      }
    } catch (e) {
      throw Exception('Erro ao buscar livros');
    }
  }
}
