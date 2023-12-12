import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = ""; //Limpar pesquisa
          },
          icon: Icon(Icons.clear)),
      //IconButton(onPressed: () {}, icon: Icon(Icons.done)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, ""); //Fechar tela
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    //print("resultado: pesquisa realizada");

    //Resultado do que o usuário digitou
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      close(context, query);
    });

    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //print("resultado: digitado " + query);
    return Container();
    //Criando uma lista de sugestões
    /*
    List<String> lista = [];
    if (query.isNotEmpty) {
      lista = ["Android", "Android navegação", "IOS", "Jogos"]
          .where((texto) => texto.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
      return ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                close(context, lista[index]);
              },
              title: Text(lista[index]),
            );
          });
    } else {
      return Center(
        child: Text("Nenhum resultado para a pesquisa!"),
      );
    }*/
  }
}
