import 'package:flutter/material.dart';
import 'package:youtube/Api.dart';
import 'package:youtube/model/Video.dart';

class Inicio extends StatefulWidget {
  String pesquisa; //Atributo
  Inicio(this.pesquisa); //Crontrutor this.pesquisa

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  //Método que retornará os vídeos
  _listarVideos(String pesquisa) {
    //Instanciar classe Api
    Api api = Api();
    return api.pesquisar(pesquisa);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listarVideos(widget.pesquisa),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    AsyncSnapshot<List<Video>> videos =
                        snapshot as AsyncSnapshot<List<Video>>;
                    Video? video = videos.data?[index];
                    return Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(video?.imagem ?? ""),
                          )),
                        ),
                        //Criando a descrição
                        ListTile(
                          title: Text(video!.titulo),
                          subtitle: Text(video.descricao),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                  itemCount: snapshot.data!.length);
            } else {
              return Center(
                child: Text("Nenhum dado a ser exibido!"),
              );
            }
            break;
        }
      },
    );
  }
}
