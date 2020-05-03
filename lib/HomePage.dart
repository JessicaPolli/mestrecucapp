
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mestrecucapp/ListaReceitasPage.dart';
import 'package:mestrecucapp/LoginPage.dart';


class HomePage extends StatefulWidget {
  final FirebaseUser user;
  HomePage({
    Key key,
    @required this.user,
  });
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Inicio(),
    listaReceitas(lista: "Recentes",),
    listaReceitas(lista: "Favoritos",),
    listaReceitas(lista: "Minhas receitas",),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.user.email);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Mestre Cuca App')
      ),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(

                accountName: Text('Nome Usuário'),
                accountEmail: Text(widget.user.email),
                currentAccountPicture: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/images/usuario.jpg'),
                ),
              ),
              ListTile(
                  title: Text('Perfil'),
                  leading: Icon(Icons.person_pin),
                  trailing: Icon(Icons.navigate_next),
                  onTap: () {
                    debugPrint('Clicou no menu 1');
                  }
              ),
              ListTile(
                  title: Text('Configurações'),
                  leading: Icon(Icons.settings),
                  trailing: Icon(Icons.navigate_next),
                  onTap: () {
                    debugPrint('Clicou no menu 2');
                  }
               ),
              ListTile(
                title: Text("Sair"),
                leading: Icon(Icons.exit_to_app),
                trailing: Icon(Icons.navigate_next),
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                },
              )

            ],
          )
      ),
      body:_widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (int index) => setState(() {
            setState(() {
              _selectedIndex = index;
            });
          }),
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          items:const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home,),
                title: Text('Início')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_time),
                title: Text('Recentes'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border,),
                title: Text('Favoritas', )
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant),
              title: Text('Receitas'),
            ),
          ]
      ),
    );
  }
}
class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 5),
      child: Column(

        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  margin: EdgeInsets.only(left: 6, right: 3),
                  width: MediaQuery.of(context).size.width*.47,
                  child:InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> listaReceitas(lista:"Frituras",)));
                    },
                    child:  Image.asset(
                      "assets/images/fritas.jpg",
                    ),
                  )
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                margin: EdgeInsets.only(left: 6, right: 3),
                width: MediaQuery.of(context).size.width*.47,
                child:InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> listaReceitas(lista:"Sobremesas",)));
                  },
                  child:  Image.asset(
                    "assets/images/sobremesa.jpg",
                  ),
                )
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  margin: EdgeInsets.only(left: 6, right: 3),
                  width: MediaQuery.of(context).size.width*.47,
                  child:InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> listaReceitas(lista:"Assados",)));
                    },
                    child:  Image.asset(
                      "assets/images/assados.jpg",
                    ),
                  )
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  margin: EdgeInsets.only(left: 6, right: 3),
                  width: MediaQuery.of(context).size.width*.47,
                  child:InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> listaReceitas(lista:"Bolos e tortas",)));
                    },
                    child:  Image.asset(
                      "assets/images/bolo.jpg",
                    ),
                  )
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  margin: EdgeInsets.only(left: 6, right: 3),
                  width: MediaQuery.of(context).size.width*.47,
                  child:InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> listaReceitas(lista:"Bebidas cafeínadas",)));
                    },
                    child:  Image.asset(
                      "assets/images/cafe.jpg",
                    ),
                  )
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  margin: EdgeInsets.only(left: 6, right: 3),
                  width: MediaQuery.of(context).size.width*.47,
                  child:InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> listaReceitas(lista:"Cupcakes",)));
                    },
                    child:  Image.asset(
                      "assets/images/cupcake.jpg",
                    ),
                  )
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  margin: EdgeInsets.only(left: 6,right: 3),
                  width: MediaQuery.of(context).size.width*.47,
                  child:InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> listaReceitas(lista:"Biscoitos",)));
                    },
                    child:  Image.asset(
                      "assets/images/donuts.jpg",
                    ),
                  )
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  margin: EdgeInsets.only(left: 6, right: 3),
                  width: MediaQuery.of(context).size.width*.47,
                  child:InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> listaReceitas(lista:"Bebidas",)));
                    },
                    child:  Image.asset(
                      "assets/images/drinks.jpg",
                    ),
                  )
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  margin: EdgeInsets.only(left: 6, right: 3),
                  width: MediaQuery.of(context).size.width*.47,
                  child:InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> listaReceitas(lista:"Fitness",)));
                    },
                    child:  Image.asset(
                      "assets/images/fitness.jpg",
                    ),
                  )
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  margin: EdgeInsets.only(left: 6, right: 3),
                  width: MediaQuery.of(context).size.width*.47,
                  child:InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> listaReceitas(lista:"Sorvetes",)));
                    },
                    child:  Image.asset(
                      "assets/images/sorvete.jpg",
                    ),
                  )
              ),
            ],
          ),

        ],
      ),
    );
  }
}
