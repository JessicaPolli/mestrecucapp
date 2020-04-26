
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontSize: 20, color: Colors.white);
  String _usuario="";
  String _senha="";
  final frmLoginKey = GlobalKey<FormState>();

  void _validarLogin(){
    final form =frmLoginKey.currentState;
    if(form.validate()){
      form.save();
      if(_usuario=="teste12" && _senha=="teste12" ){
        Navigator.of(context).pushNamedAndRemoveUntil( "/HomePage", (route) => false);
      }else{
        showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                title: Text("Erro Login"),
                content: Text("Usuário e/ou senha inválidos!"),
              );
            }
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    final usuarioField= TextFormField(
      obscureText: false,
      style: style,
      onSaved: (valor){
        _usuario = valor;
      },
      validator: (valor){
        return valor.length<6? "Usuário deve ter no mínimo 6 caracteres": null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText:  'Usuário',
        labelStyle: TextStyle(fontSize: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32), ),
        enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: BorderRadius.circular(32), ),
      ),
    );
    final senhaField= TextFormField(
      obscureText: true,
      style: style,
      onSaved: (valor){
        _senha = valor;
      },
      validator: (valor){
        return valor.length<6? "Senha deve ter no minimo 6 caracteres": null;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.circular(32), ),
        enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: BorderRadius.circular(32), ),
        labelText:  'Senha',
        labelStyle: TextStyle(fontSize: 16)
      ),
    );
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.black,
                child: Padding(
                    padding: const EdgeInsets.all(36),
                    child: Form(
                      key: frmLoginKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 155,
                            child: Image.asset('assets/images/logo.png'),
                          ),
                          SizedBox(
                            height: 45,
                          ),
                          usuarioField,
                          SizedBox(
                            height: 15,
                          ),
                          senhaField,
                          SizedBox(
                            height: 25,
                          ),
                          RaisedButton(
                            padding: EdgeInsets.all(20),
                            color: Colors.lightBlue,
                            child: Container(
                              width: MediaQuery.of(context).size.width*.85,
                              child: Text('LOGIN', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                            ),
                            focusColor: Color(0xFFCF9F77),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                                side: BorderSide(color: Colors.blue)
                            ),
                            elevation: 7.0,
                            onPressed: (){
                              _validarLogin();
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          FlatButton(
                              onPressed: () => showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                        content: Text('Acesso a tela de registro de usuários!')
                                    );
                                  }
                              ),
                              child: Text('Registre-se',
                                  style: TextStyle(fontSize: 25, color:Color(0xFFffffff),)
                              )
                          )
                        ],
                      ),
                    )
                ),
              )
          ),
        )
    );
  }
}
