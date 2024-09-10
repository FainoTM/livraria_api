import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livraria_app_api/controller/book_controller.dart';
import 'package:livraria_app_api/model/book_model.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  final BookController bookController = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livraria'),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      body: Obx(() {
        if (bookController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Filtrar Lista: ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              DropdownButton<String>(
                value: bookController.selectedList.value,
                items: bookController.listNames.map((listName) {
                  return DropdownMenuItem<String>(
                    value: listName,
                    child: Text(listName),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    bookController.selectedList.value = value;
                    bookController.fetchBooks(value);
                  }
                },
              ),
            ]),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 50),
                child: ListView.builder(
                  itemCount: bookController.books.length,
                  itemBuilder: (context, index) {
                    Book book = bookController.books[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => DetailPage(book: book));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            title: Text(book.title),
                            subtitle: Text(book.description),
                            trailing: Text(book.price),
                            leading: book.image.isNotEmpty
                                ? Image.network(
                                    book.image,
                                  )
                                : Icon(Icons.image_not_supported),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
