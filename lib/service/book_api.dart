import 'package:dio/dio.dart';
import 'package:livraria_app_api/model/book_model.dart';

class BookApi {
  final Dio dio = Dio();

  Future<List<Book>> getBooks() async {
    try {
      final response = await dio.get(
          'https://api.nytimes.com/svc/books/v3/lists/best-sellers/history.json?api-key=ffXDPpMWGZuYfC3Q3FzyNGG5PiCBVWod');

      if (response.statusCode == 200) {
        List<Book> books = (response.data['results'] as List<dynamic>)
            .map((bookData) => Book.fromJson(bookData as Map<String, dynamic>))
            .toList();
        return books;
      } else {
        throw Exception('Falha ao carregar');
      }
    } catch (e) {
      throw Exception('Erro ao buscar livros: $e');
    }
  }
}
