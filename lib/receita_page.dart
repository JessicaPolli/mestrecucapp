import 'dart:convert';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class Receita extends StatefulWidget {
  final receita;
  Receita({
    Key key,
    @required this.receita
}): super(key: key);
  @override
  _ReceitaState createState() => _ReceitaState();
}

class _ReceitaState extends State<Receita> {
  TextStyle estilo = TextStyle(fontSize: 16, height: 2);
  @override
  Widget build(BuildContext context) {

    var data = widget.receita["data"].toDate();
    var _data = formatDate(data, [dd, '/', mm, '/', yyyy]);
    print(widget.receita['titulo']);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.receita["titulo"]),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 50, right: 10, left: 10),
        child: Container(
          padding: EdgeInsets.all(5),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 15),
                  child:  CircleAvatar(
                    radius: 80,
                    backgroundImage:widget.receita["foto"]==null?AssetImage('assets/images/images.png'):MemoryImage(base64.decode(widget.receita["foto"])),
                  ),
                ),
              ),
              Text("${widget.receita["descricao"]}", style: TextStyle(fontSize: 18),  textAlign: TextAlign.center,),
              Text("Tempo de preparo: ${widget.receita["tempo"]} minutos", style: estilo,),
              Text("Porção: ${widget.receita["porcoes"]}", style: estilo,),

              Text("Ingredientes:", style: estilo,),
              CheckboxGroup(labels: List<String>.from(widget.receita["ingredientes"]), checkColor: Colors.blue, ),
              Text("Modo de preparo: ", style: estilo,),
              ListView.builder(
               padding: EdgeInsets.only(top: 20, bottom: 30),
               shrinkWrap: true,
               scrollDirection: Axis.vertical,
               itemCount: widget.receita["modo_preparo"].length==null?0: widget.receita["modo_preparo"].length,
               itemBuilder: (BuildContext context, int index){
                  return Container(
                    padding: EdgeInsets.only(bottom: 10, top: 5),
                    child:  Row(

                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width*.1,
                          child: Text("${index+1} - ") ,

                        ),
                        Container(

                          child: Text("${widget.receita["modo_preparo"][index]}", overflow: TextOverflow.visible, ),
                          width: MediaQuery.of(context).size.width*.815,
                        )

                      ],
                    ),
                  );
               },
              ),
              Text("Autor: ${widget.receita["autor"]}", style: estilo,),
              Text("Data: $_data", style: estilo,),
            ],
          ),
        ),
      )
    );
  }
}
