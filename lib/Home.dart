import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/inicio.dart';
import 'package:youtube/telas/inscricoes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Atributos
  int _indiceAtual = 0; //Proipriedade
  String _resultado = ""; //Propriedade

  @override
  Widget build(BuildContext context) {
    //Carregando páginas
    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];
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
              onPressed: () async {
                //Apresentar pesquisa ao clicar na lupa
                String? res = await showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
                setState(() {
                  _resultado = res!;
                });
                print("resultado: digitado " + res!);
              },
              icon: Icon(Icons.search)),

          /*IconButton(
              onPressed: () {
                print("acao: videocam");
              },
              icon: Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),*/
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indiceAtual,
          onTap: (indice) {
            setState(() {
              _indiceAtual = indice;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
                //backgroundColor: Colors.orange,
                label: "Início",
                icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                //backgroundColor: Colors.red,
                label: "Em alta",
                icon: Icon(Icons.whatshot)),
            BottomNavigationBarItem(
                //backgroundColor: Colors.blue,
                label: "Incrições",
                icon: Icon(Icons.subscriptions)),
            BottomNavigationBarItem(
                //backgroundColor: Colors.green,
                label: "Bibliotéca",
                icon: Icon(Icons.folder)),
          ]),
    );
  }
}
