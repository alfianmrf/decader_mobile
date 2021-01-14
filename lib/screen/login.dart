import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:decader/network_utils/api.dart';
import 'package:decader/screen/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:decader/screen/register.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var email;
  var password;
  Color orange = const Color.fromRGBO(244, 144, 31, 1);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child : Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                        child: Text(
                          'Decader',
                          style: TextStyle(
                              fontSize: 45.0, fontWeight: FontWeight.bold, color: orange
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 10, 0.0, 0.0),
                        child: Text(
                          'Selamat Datang !',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white
                          ),
                        ),
                      ),

                      Container(
                          padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                          child:Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                        fontSize: 15,
                                        color: orange,
                                        fontWeight: FontWeight.w600
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: orange)
                                    ),
                                  ),

                                  validator: (emailValue) {
                                    if (emailValue.isEmpty) {
                                      return 'Please enter email';
                                    }
                                    email = emailValue;
                                    return null;
                                  },
                                ),

                                SizedBox(height: 20.0),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                        fontSize: 15,
                                        color: orange,
                                        fontWeight: FontWeight.w600
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: orange)
                                    ),
                                  ),
                                  validator: (passwordValue) {
                                    if (passwordValue.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    password = passwordValue;
                                    return null;
                                  },
                                ),
                                SizedBox(height: 5.0),
                                Container(
                                  alignment: Alignment(1.0, 0.0),
                                  padding: EdgeInsets.only(top: 15.0, left: 20.0),
                                  child: InkWell(
                                      child:Text(
                                        'Forget Password ?',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600
                                        ),
                                      )
                                  ),
                                ),

                                SizedBox(height: 60.0),
                                ButtonTheme(
                                  minWidth: double.infinity,
                                  child : FlatButton(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 10, bottom: 10, left: 10, right: 10),
                                      child: Text(
                                        _isLoading? 'Proccessing...' : 'Login',
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    color: orange,
                                    disabledColor: Colors.grey,
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                        new BorderRadius.circular(20.0)),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        _login();
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                      ),

                      Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Baru di Decader ?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(width: 5.0),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) => Register()));
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                    color: orange,
                                    fontSize: 15.0,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
  void _login() async{
    setState(() {
      _isLoading = true;
    });
    var data = {
      'email' : email,
      'password' : password
    };

    var res = await Network().login(data, '/login');
    var body = json.decode(res.body);
    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => Home()
        ),
      );
    }else{
      _showMsg(body['message']);
    }

    setState(() {
      _isLoading = false;
    });

  }
}