import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mestrecucapp/ReceitaPage.dart';

class listaReceitas extends StatefulWidget {
  final lista;

  listaReceitas({
    Key key,
    this.lista
  }) : super(key: key);
  @override
  _listaReceitasState createState() => _listaReceitasState();
}

class _listaReceitasState extends State<listaReceitas> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: Text(widget.lista, style: TextStyle(color: Colors.white),),
      ),
      backgroundColor: Colors.white,
      body:  ListView(

        children: <Widget>[
          Card(
            elevation: 5,
            margin: EdgeInsets.all(5),
            color: Colors.white70,

            child: ListTile(

              title: Text("Nome da Receita", style: TextStyle(fontWeight: FontWeight.bold),),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/donuts.jpg"),
              ),
              subtitle: Text("Loren ipsum dolor sit amet ", overflow: TextOverflow.ellipsis,),
              trailing: Icon(Icons.navigate_next),
            ),
          ),
          Card(

            elevation: 5,
            margin: EdgeInsets.all(5),
            color: Colors.white70,

            child: ListTile(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Receita(cod: "0"))),
              title: Text("Nome da Receita", style: TextStyle(fontWeight: FontWeight.bold),),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/bolo.jpg"),
              ),
              subtitle: Text("Loren ipsum dolor sit amet ", overflow: TextOverflow.ellipsis,),
              trailing: Icon(Icons.navigate_next),
            ),
          ),
        ],
      ),
    );
  }
}
