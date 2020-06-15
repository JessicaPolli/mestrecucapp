import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mestrecucapp/receita_page.dart';

class listaReceitas extends StatefulWidget {
  final lista;
  final retorno;
  final autor;
  listaReceitas({
    Key key,
    this.lista,
    this.retorno,
    this.autor,
  }) : super(key: key);
  @override
  _listaReceitasState createState() => _listaReceitasState();
}

class _listaReceitasState extends State<listaReceitas> {
  @override
  Widget ListReceitas(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: widget.lista=="Recentes"
          ?Firestore.instance.collection('receitas').limit(10).orderBy("data", descending: true).snapshots(): widget.lista=="Minhas receitas"
          ?Firestore.instance.collection('receitas').where("autor", isEqualTo: widget.autor).orderBy("data", descending: true).snapshots()
          :Firestore.instance.collection('receitas').where("categoria", isEqualTo: widget.lista).orderBy("data", descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Carregando...'); break;
          case ConnectionState.none: return new Text("Nenhum item encontrado.");
          default:
            return new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                var byte = base64.decode(document["foto"].toString());
                return
                 new  Card(
                  elevation: 5,
                  margin: EdgeInsets.all(5),
                  color: Colors.white70,
                  child: ListTile(

                    onTap: (){
                      print('teste');
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Receita(receita: document)));
                    },
                    title: Text(document["titulo"], style: TextStyle(fontWeight: FontWeight.bold),),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: byte==null?AssetImage('assets/images/images.png'):MemoryImage(byte),
                    ),
                    subtitle: Text(document["descricao"], overflow: TextOverflow.ellipsis,),
                    trailing: Icon(Icons.navigate_next),
                  ),
                );
              }).toList(),
            );
        }
      },
    );
  }
  Widget build(BuildContext context) {

    return widget.retorno==0? Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.lista,),
      ),
      backgroundColor: Colors.white,
      body:  ListReceitas(context),
    ):ListReceitas(context);
  }
}
