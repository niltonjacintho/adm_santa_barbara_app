class PastoraisModel {
  String id;
  String codigo;
  String conteudo;
  String ordem;
  String sigla;
  String titulo;
  String imagem;
  DateTime dtInclusao;
  DateTime dtAlteracao;
  bool ativo;
  List<Comentarios> comentarios;

  PastoraisModel(
      {this.id,
      this.codigo,
      this.conteudo,
      this.ordem,
      this.sigla,
      this.titulo,
      this.imagem,
      this.dtInclusao,
      this.dtAlteracao,
      this.ativo,
      this.comentarios});

  PastoraisModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    codigo = json['codigo'];
    conteudo = json['conteudo'];
    ordem = json['ordem'];
    sigla = json['sigla'];
    titulo = json['titulo'];
    imagem = json['imagem'];
    dtInclusao = json['dtInclusao'];
    dtAlteracao = json['dtAlteracao'];
    ativo = json['ativo'];
    if (json['comentarios'] != null) {
      comentarios = [];
     // new List<Comentarios>();
      json['comentarios'].forEach((v) {
        comentarios.add(new Comentarios.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['codigo'] = this.codigo;
    data['conteudo'] = this.conteudo;
    data['ordem'] = this.ordem;
    data['sigla'] = this.sigla;
    data['titulo'] = this.titulo;
    data['imagem'] = this.imagem;
    data['dtInclusao'] = this.dtInclusao;
    data['dtAlteracao'] = this.dtAlteracao;
    data['ativo'] = this.ativo;
    if (this.comentarios != null) {
      data['comentarios'] = this.comentarios.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comentarios {
  String comentario;
  String data;
  String usuario;

  Comentarios({this.comentario, this.data, this.usuario});

  Comentarios.fromJson(Map<String, dynamic> json) {
    comentario = json['comentario'];
    data = json['data'];
    usuario = json['usuario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comentario'] = this.comentario;
    data['data'] = this.data;
    data['usuario'] = this.usuario;
    return data;
  }
}
