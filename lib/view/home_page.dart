import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          child: ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(10, (index) {
              return Center(
                  child: Container(
                height: 100,
                child: Row(
                  children: [
                    Text('imagem'),
                    Column(
                      children: [Text('title'), Text('Descrição $index')],
                    )
                  ],
                ),
              ));
            }),
          ),
        ));
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
