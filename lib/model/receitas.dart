import 'package:cloud_firestore/cloud_firestore.dart';
class Receita{
  final id;
  final autor;
  final categoria;
  final data;
  final descricao;
  final foto;
  final ingredientes;
  final modo_preparo;
  final porcoes;
  final tempo;
  final titulo;

  Receita({this.id, this.autor, this.categoria, this.data,
      this.descricao, this.foto, this.ingredientes,
      this.modo_preparo, this.porcoes, this.tempo, this.titulo});

  factory Receita.fromJson(Map<String, dynamic> json)=> Receita(
    id: json['id'],
    autor: json['autor'],
    categoria: json['categoria'],
    data: json['data'],
    descricao: json['descricao'],
    foto: json['foto'],
    ingredientes: json['ingredientes'],
    modo_preparo: json['modo_preparo'],
    titulo: json['titulo'],
    porcoes: json['porcoes'],
    tempo: json['tempo']
  );
}
Future<Receita> getUsuario(email) async{
  return await Firestore.instance.collection("receitas").document(email).get().then((DocumentSnapshot ds){
    return Receita.fromJson(ds.data);
  });
}

