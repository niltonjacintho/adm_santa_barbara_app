class OracoesModel {
  List<Grupo> grupo;

  OracoesModel({this.grupo});

  OracoesModel.fromJson(Map<String, dynamic> json) {
    if (json['grupo'] != null) {
      grupo = [];
      // new List<Grupo>();
      json['grupo'].forEach((v) {
        grupo.add(new Grupo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grupo'] = this.grupo.map((v) => v.toJson()).toList();
      return data;
  }
}

class Grupo {
  String id;
  String nome;
  String url;
  List<Oracoes> oracoes;

  Grupo({this.id, this.nome, this.url, this.oracoes});

  Grupo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    url = json['url'];
    if (json['oracoes'] != null) {
      oracoes = [];
     // new List<Oracoes>();
      json['oracoes'].forEach((v) {
        oracoes.add(new Oracoes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['url'] = this.url;
    data['oracoes'] = this.oracoes.map((v) => v.toJson()).toList();
      return data;
  }
}

class Oracoes {
  String id;
  String titulo;
  String texto;
  String grupo;

  Oracoes({this.id, this.titulo, this.texto, this.grupo});

  Oracoes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    texto = json['texto'];
    grupo = json['grupo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['texto'] = this.texto;
    data['grupo'] = this.grupo;
    return data;
  }
}
