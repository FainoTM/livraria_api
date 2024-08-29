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
      body: GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: 1,
          children: List.generate(
            10,
            (index) {
              return Center(
                  child: Card(
                child: Row(),
              ));
            },
          )),
    );
  }
}
