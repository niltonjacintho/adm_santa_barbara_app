import 'dart:convert';

class DocumentsModel {
  String titulo;
  String get getTitulo => titulo;
  set setTitulo(String titulo) => this.titulo = titulo;
  String subtitulo;
  String conteudo;
  String imagem;
  String video;
  DateTime dtInclusao;
  bool ativo;
  DateTime dtLimiteExibicao;
  String autor;
  int visualizacoes;
  int likes;
  String id;
  String grupo;
  DocumentsModel({
    this.titulo,
    this.subtitulo,
    this.conteudo,
    this.imagem,
    this.video,
    this.dtInclusao,
    this.ativo,
    this.dtLimiteExibicao,
    this.autor,
    this.visualizacoes,
    this.likes,
    this.grupo,
    this.id,
  });

  DocumentsModel copyWith({
    String titulo,
    String subtitulo,
    String conteudo,
    String imagem,
    String video,
    DateTime dtInclusao,
    bool ativo,
    DateTime dtLimiteExibicao,
    String autor,
    int visualizacoes,
    int likes,
    String grupo,
    String id,
  }) {
    return DocumentsModel(
      titulo: titulo ?? this.titulo,
      subtitulo: subtitulo ?? this.subtitulo,
      conteudo: conteudo ?? this.conteudo,
      imagem: imagem ?? this.imagem,
      video: video ?? this.video,
      dtInclusao: dtInclusao ?? this.dtInclusao,
      ativo: ativo ?? this.ativo,
      dtLimiteExibicao: dtLimiteExibicao ?? this.dtLimiteExibicao,
      autor: autor ?? this.autor,
      visualizacoes: visualizacoes ?? this.visualizacoes,
      likes: likes ?? this.likes,
      grupo: grupo ?? this.grupo,
      id: id ?? this.id,
    );
  }

  DocumentsModel newDocument() {
    DocumentsModel d = new DocumentsModel();
    d.id = new DateTime.now().millisecondsSinceEpoch.toString();
    return d;
  }

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'subtitulo': subtitulo,
      'conteudo': conteudo,
      'imagem': imagem,
      'video': video,
      'dtInclusao': dtInclusao,
      'ativo': ativo,
      'dtLimiteExibicao': dtLimiteExibicao,
      'autor': autor,
      'visualizacoes': visualizacoes,
      'likes': likes,
      'grupo': grupo,
      'id': id,
    };
  }

  static DocumentsModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return DocumentsModel(
      titulo: map['titulo'],
      subtitulo: map['subtitulo'],
      conteudo: map['conteudo'],
      imagem: map['imagem'],
      video: map['video'],
      dtInclusao: map['dtInclusao'],
      ativo: map['ativo'],
      dtLimiteExibicao: map['dtLimiteExibicao'],
      autor: map['autor'],
      visualizacoes: map['visualizacoes']?.toInt(),
      likes: map['likes']?.toInt(),
      grupo: map['grupo'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  static DocumentsModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'DocumentsModel(titulo: $titulo, subtitulo: $subtitulo, conteudo: $conteudo, imagem: $imagem, video: $video, dtInclusao: $dtInclusao, ativo: $ativo, dtLimiteExibicao: $dtLimiteExibicao, autor: $autor, visualizacoes: $visualizacoes, likes: $likes, grupo: $grupo )';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is DocumentsModel &&
        o.titulo == titulo &&
        o.subtitulo == subtitulo &&
        o.conteudo == conteudo &&
        o.imagem == imagem &&
        o.video == video &&
        o.dtInclusao == dtInclusao &&
        o.ativo == ativo &&
        o.dtLimiteExibicao == dtLimiteExibicao &&
        o.autor == autor &&
        o.visualizacoes == visualizacoes &&
        o.likes == likes &&
        o.grupo == grupo &&
        o.id == id;
  }

  @override
  int get hashCode {
    return titulo.hashCode ^
        subtitulo.hashCode ^
        conteudo.hashCode ^
        imagem.hashCode ^
        video.hashCode ^
        dtInclusao.hashCode ^
        ativo.hashCode ^
        dtLimiteExibicao.hashCode ^
        autor.hashCode ^
        visualizacoes.hashCode ^
        likes.hashCode ^
        grupo.hashCode ^
        id.hashCode;
  }
}
