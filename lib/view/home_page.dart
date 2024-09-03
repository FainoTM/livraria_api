import 'package:flutter/material.dart';
import 'package:livraria_app_api/service/book_api.dart';

import '../model/book_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BookApi _getbook = BookApi();
  List<Book> _books = [];

  @override
  void initState() {
    super.initState();
    _fetchBook();
  }

  Future<void> _fetchBook() async {
    try {
      var book = await _getbook.getBooks();
      setState(() {
        _books = book;
      });
    } catch (e) {
      throw Exception('erro $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Livraria'),
          backgroundColor: Colors.lightGreen,
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _books.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: _books.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 200,
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(_books[index].title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        'Descrição: ${_books[index].description}'),
                                    Text('Autor: ${_books[index].author}'),
                                    Text('Preço: ${_books[index].price}'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    })));
  }
}

/*
GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: 1,
          children: List.generate(
            10,
            (index) {
              return Center(
                  child: Container(
                child: Row(
                  children: [
                    Text('imagem'),
                    Column(
                      children: [Text('title'), Text('Descrição $index')],
                    )
                  ],
                ),
              ));
            },
          )),*/
