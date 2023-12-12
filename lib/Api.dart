import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyADPdy9f3AkLHiKFXmCsrqMNSODTkuf8F0";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  //Metodo pesquisar
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(Uri.parse(URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa"));

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body.toString());

      //Criando método map para percorrer cada item dentro dos dadosJson
      List<Video> videos = dadosJson["items"].map<Video>(
          //Passando funçaõ anonima
          (map) {
        return Video.fromJson(map);
        //return Video.converterJson(map);
      }).toList();
      //Retornando os vídeos
      return videos;

      /*Apresentando a lista de vídeos
      for (var video in videos) {
        print("resultado: " + video.titulo);
      }*/

      /*Exemplos de código
      *for (var video in dadosJson["items"]) {
        print("Resultado: " + video.toString());
      }*/
      //print("resultado: " + dadosJson["items"].toString());
    } else {}
    return pesquisar(pesquisa);
  }
}
