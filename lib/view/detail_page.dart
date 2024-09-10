import 'package:flutter/material.dart';
import 'package:livraria_app_api/model/book_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Book book;

  DetailPage({required this.book});

  void _launchURL() async {
    final Uri url = Uri.parse(book.buy);
    //if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
    // } else {
    //   throw 'Não foi possível abrir o URL: $url';
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(book.image,
                  height: 200, width: 150, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text(
                book.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                book.description,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                book.price,
                style: TextStyle(fontSize: 18, color: Colors.green),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _launchURL, // Aciona a função para abrir o URL
                child: Text('Comprar na Amazon'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
