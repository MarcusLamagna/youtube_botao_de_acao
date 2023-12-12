class Video {
  String id;
  String titulo;
  String descricao;
  String? imagem;
  String canal;

//Criando contrutor
  Video(
      {required this.id,
      required this.titulo,
      required this.descricao,
      required this.imagem,
      required this.canal});

//Criando método static
/*
*Esse código resolve o problema, porém, não otimiza a execução dos códigos
static converterJson(Map<String, dynamic> json){
  return Video(
    id: json["id"]["videoId"],
    titulo: json["snippet"]["title"],
    imagem: json["snippet"]["thumbnails"]["high"]["url"],
    canal: json["snippet"]["channelId"], descricao: '',
  );
}*/

//Criando um construtor fromJson
/*Factory retorna apenas um objeto, ou seja, criamos uma unica instancia 
  dentro desse construtor, utilizando o contrutor nomeado fromJson, teremos uma
  única instancia de vídeo que retorna toda vez.
*/
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      descricao: json["snippet"]["description"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelId"],
    );
  }
}
