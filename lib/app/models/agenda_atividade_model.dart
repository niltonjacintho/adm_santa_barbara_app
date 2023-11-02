import 'dart:convert';

class AgendaAtividade {
  String id;
  String data;
  String atividade;
  String pastoral;
  String hora;
  String local;
  String detalhes;
  AgendaAtividade(
      {this.id,
      this.data,
      this.atividade,
      this.pastoral,
      this.hora,
      this.local,
      this.detalhes});

  AgendaAtividade copyWith({
    String data,
    String atividade,
    String pastoral,
    String hora,
    String local,
  }) {
    return AgendaAtividade(
      data: data ?? this.data,
      atividade: atividade ?? this.atividade,
      pastoral: pastoral ?? this.pastoral,
      hora: hora ?? this.hora,
      local: local ?? this.local,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'data': data,
      'atividade': atividade,
      'pastoral': pastoral,
      'hora': hora,
      'local': local,
      'detalhes': detalhes,
    };
  }

  Map<String, dynamic> toMapEvent() {
    return {
      'id': id,
      'data': data,
      'atividade': atividade,
      'pastoral': pastoral,
      'hora': hora,
      'local': local,
      'detalhes': detalhes,
    };
  }

  // static AgendaAtividade fromMap(Map<String, dynamic> map) {
  //   if (map == null) return null;

  //   return AgendaAtividade(
  //     data: map['data'],
  //     atividade: map['atividade'],
  //     pastoral: map['pastoral'],
  //     hora: map['hora'],
  //     local: map['local'],
  //   );
  // }

  String toJson() => json.encode(toMap());

  // static AgendaAtividade fromJson(String source) =>
  //     fromMap(json.decode(source));

  @override
  String toString() {
    return 'AgendaAtividade(id: $id, data: $data, atividade: $atividade, pastoral: $pastoral, hora: $hora, local: $local)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AgendaAtividade &&
        o.id == id &&
        o.data == data &&
        o.atividade == atividade &&
        o.pastoral == pastoral &&
        o.hora == hora &&
        o.local == local &&
        o.detalhes == detalhes;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        data.hashCode ^
        atividade.hashCode ^
        pastoral.hashCode ^
        hora.hashCode ^
        local.hashCode ^
        detalhes.hashCode;
  }
}
