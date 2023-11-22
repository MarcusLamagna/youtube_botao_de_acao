import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        title: Image.asset(
          "imagens/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                print("acao: videocam");
              },
              icon: Icon(Icons.videocam)),
          IconButton(
              onPressed: () {
                print("acao: Pesquisa");
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                print("acao: Conta");
              },
              icon: Icon(Icons.account_circle)),
        ],
      ),
      body: Container(),
    );
  }
}
