import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:decader/network_utils/api.dart';
import 'package:decader/screen/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:decader/screen/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  Color orange = const Color.fromRGBO(244, 144, 31, 1);
  var email;
  var password;
  var fname;
  var lname;
  var phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/background.png"),
                    fit: BoxFit.fitWidth,
                  ),
              ),
              child: SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(15.0, 60.0, 0.0, 0.0),
                              child: Text(
                                'Decader',
                                style: TextStyle(
                                    fontSize: 45.0, fontWeight: FontWeight.bold, color: orange
                                ),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.fromLTRB(17.0, 8, 0.0, 0.0),
                              child: Text(
                                'Daftar',
                                style: TextStyle(
                                    fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white
                                ),
                              ),
                            ),

                            Container(
                                padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
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

                                      TextFormField(
                                        keyboardType: TextInputType.text,
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                        decoration: InputDecoration(
                                          labelText: 'First Name',
                                          labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: orange,
                                              fontWeight: FontWeight.w600
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: orange)
                                          ),
                                        ),

                                        validator: (firstname) {
                                          if (firstname.isEmpty) {
                                            return 'Please enter your first name';
                                          }
                                          fname = firstname;
                                          return null;
                                        },
                                      ),

                                      TextFormField(
                                        keyboardType: TextInputType.text,
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                        decoration: InputDecoration(
                                          labelText: 'Last Name',
                                          labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: orange,
                                              fontWeight: FontWeight.w600
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: orange)
                                          ),
                                        ),

                                        validator: (lastname) {
                                          if (lastname.isEmpty) {
                                            return 'Please enter your last name';
                                          }
                                          lname = lastname;
                                          return null;
                                        },
                                      ),

                                      TextFormField(
                                        keyboardType: TextInputType.text,
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                        decoration: InputDecoration(
                                          labelText: 'Phone',
                                          labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: orange,
                                              fontWeight: FontWeight.w600
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: orange)
                                          ),
                                        ),

                                        validator: (phonenumber) {
                                          if (phonenumber.isEmpty) {
                                            return 'Please enter phone number';
                                          }
                                          phone = phonenumber;
                                          return null;
                                        },
                                      ),

                                      TextFormField(
                                        controller: _passwordController,
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

                                      TextFormField(
                                        controller: _confirmPasswordController,
                                        keyboardType: TextInputType.text,
                                        obscureText: true,
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                        decoration: InputDecoration(
                                          labelText: 'Confirm Password',
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
                                            return 'Please re-entered password';
                                          }
                                          else if(passwordValue != _passwordController.value.text){
                                            return 'Password do not match';
                                          }
                                          return null;
                                        },
                                      ),


                                      SizedBox(height: 20.0),
                                      ButtonTheme(
                                        minWidth: double.infinity,
                                        child : FlatButton(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, bottom: 10, left: 10, right: 10),
                                            child: Text(
                                              _isLoading? 'Proccessing...' : 'Register',
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
                                              _register();
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ),

                            Padding(
                                padding: const EdgeInsets.only(top: 20, bottom: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Suah Punya Akun ?',
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
                                                builder: (context) => Login()));
                                      },
                                      child: Text(
                                        'Login',
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
              )
            ),
          ],
        )
        );
  }
  void _register()async{
    setState(() {
      _isLoading = true;
    });
    var data = {
      'email' : email,
      'password': password,
      'phone': phone,
      'fname': fname,
      'lname': lname
    };

    var res = await Network().authData(data, '/register');
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
    }

    setState(() {
      _isLoading = false;
    });
  }
}