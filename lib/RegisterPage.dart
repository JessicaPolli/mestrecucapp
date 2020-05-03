
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterPage extends StatefulWidget {
  final String title = 'Nova conta';
  @override
  State<StatefulWidget> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;
  TextStyle style = TextStyle(fontSize: 20, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child:Container(
              padding: const EdgeInsets.all(36),
              height: MediaQuery.of(context).size.height,
              color: Colors.black,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  SizedBox(
                      height: 155,
                      child: Center(
                        child: Image.asset('assets/images/logo.png'),
                      )
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  TextFormField(
                    obscureText: false,
                    style: style,
                    controller: _emailController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Informe um email válido';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      labelText:  'Email',
                      labelStyle: TextStyle(fontSize: 16),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32), ),
                      enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: BorderRadius.circular(32), ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(

                    obscureText: true,
                    controller: _passwordController,
                    style: style,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2.0, style: BorderStyle.solid), borderRadius: BorderRadius.circular(32), ),
                        enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: BorderRadius.circular(32), ),
                        labelText:  'Senha',
                        labelStyle: TextStyle(fontSize: 16)
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Informe uma senha válida';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  RaisedButton(
                    padding: EdgeInsets.all(20),
                    color: Colors.lightBlue,
                    child: Container(
                      width: MediaQuery.of(context).size.width*.85,
                      child: Text('Registrar', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                    ),
                    focusColor: Color(0xFFCF9F77),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.blue)
                    ),
                    elevation: 7.0,
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _register();
                        showDialog(
                          context:  context,
                          builder:  (BuildContext context) {
                            return AlertDialog(
                              title:Text(_success == null
                                  ? ''
                                  : (_success
                                  ? 'Registrado com sucesso ' + _userEmail
                                  : 'Falha ao realizar cadastro'),
                              ),
                                actions: <Widget>[
                                FlatButton(
                                  child: Text("Ir para pág. Login"),
                                  onPressed:  () {
                                    Navigator.of(context).pushNamedAndRemoveUntil( "/LoginPage", (route) => false);
                                  },
                                ),
                                ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            )
        ),
      )
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Example code for registration.
  void _register() async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      _success = false;
    }
  }
}