import 'dart:convert';
import 'package:decader/screen/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'account_edit.dart';

class Confirmpass extends StatefulWidget {
  @override
  _ConfirmState createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirmpass> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  Color orange = const Color.fromRGBO(244, 144, 31, 1);
  var email;
  var password;
  var fname;
  var lname;
  var phone;

  @override
  void initState() {
    _loadUserData();
    super.initState();
  }

  @override
  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if (user != null) {
      setState(() {
        password = user['password'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height,
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
                                        margin: EdgeInsets.only(top:45),
                                        padding: EdgeInsets.fromLTRB(
                                            15.0, 60.0, 0.0, 0.0),
                                        child: Text(
                                          'Decader',
                                          style: TextStyle(
                                              fontSize: 45.0,
                                              fontWeight: FontWeight.bold,
                                              color: orange
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(
                                            17.0, 8, 0.0, 0.0),
                                        child: Text(
                                          'Ubah Informasi Akun',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white
                                          ),
                                        ),
                                      ),

                                      SizedBox(height: 15),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(
                                            17.0, 8, 0.0, 0.0),
                                        child: Text(
                                          'Konfirmasi Kata Sandi',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                              color: orange
                                          ),
                                        ),
                                      ),

                                      Container(
                                          padding: EdgeInsets.only(
                                              top: 15.0, left: 20.0, right: 20.0),
                                          child: Form(
                                            key: _formKey,
                                            child: Column(
                                              children: <Widget>[
                                                TextFormField(
                                                  controller: _passwordController,
                                                  keyboardType: TextInputType
                                                      .text,
                                                  obscureText: true,
                                                  style: TextStyle(
                                                      color: Colors.white
                                                  ),
                                                  decoration: InputDecoration(
                                                    labelText: 'Password',
                                                    labelStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: orange,
                                                        fontWeight: FontWeight
                                                            .w600
                                                    ),
                                                    focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: orange)
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

                                                SizedBox(height: 20.0),
                                                ButtonTheme(
                                                  minWidth: double.infinity,
                                                  child: FlatButton(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 10,
                                                          bottom: 10,
                                                          left: 10,
                                                          right: 10),
                                                      child: Text(
                                                        _isLoading
                                                            ? 'Proccessing...'
                                                            : 'Konfirmasi',
                                                        textDirection: TextDirection
                                                            .ltr,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                          decoration: TextDecoration
                                                              .none,
                                                          fontWeight: FontWeight
                                                              .bold,
                                                        ),
                                                      ),
                                                    ),
                                                    color: orange,
                                                    disabledColor: Colors.grey,
                                                    shape: new RoundedRectangleBorder(
                                                        borderRadius:
                                                        new BorderRadius.circular(
                                                            20.0)),
                                                    onPressed: () {
                                                      if (_formKey.currentState
                                                          .validate()) {
                                                        _login();
                                                        Navigator.push(
                                                            context,
                                                            new MaterialPageRoute(
                                                                builder: (
                                                                    context) =>
                                                                    Edit()));
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                      ),

                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20, bottom: 20),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: <Widget>[
                                              Text(
                                                'Tidak jadi Mengganti Informasi ?',
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
                                                          builder: (context) =>
                                                              AccountScreen()));
                                                },
                                                child: Text(
                                                  'Batalkan',
                                                  style: TextStyle(
                                                    color: orange,
                                                    fontSize: 15.0,
                                                    decoration: TextDecoration
                                                        .none,
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
            ),
          )
      ),
    );
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      'email': email,
      'password': password
    };
  }
}