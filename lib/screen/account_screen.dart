import 'dart:convert';
import 'package:decader/network_utils/api.dart';
import 'package:decader/screen/account_confirmpass.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class AccountScreen extends StatefulWidget{
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool _isLoading = false;
  Color orange = const Color.fromRGBO(244, 144, 31, 1);
  var email;
  var password;
  var fname;
  var lname;
  var phone;

  @override
  void initState(){
    _loadUserData();
    super.initState();
  }

  @override
  _loadUserData() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if(user != null) {
      setState(() {
        fname = user['fname'];
        lname = user['lname'];
        email = user['email'];
        password = user['password'];
        phone = user['phone'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
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
                                'Informasi Akun',
                                style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w600,
                                    color: orange,
                                ),
                              ),
                            ),

                            Container(
                                padding: EdgeInsets.only(
                                    top: 25.0, left: 20.0, right: 20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Email',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
                                            color: orange,
                                        ),
                                      ),

                                      SizedBox(height: 4),
                                      Text(
                                        '$email',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),

                                      SizedBox(height: 20),
                                      Text(
                                        'Full Name',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                          color: orange,
                                        ),
                                      ),

                                      SizedBox(height: 4),
                                      Text(
                                        '$fname $lname',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),

                                      SizedBox(height: 20),
                                      Text(
                                        'Phone',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                          color: orange,
                                        ),
                                      ),

                                      SizedBox(height: 4),
                                      Text(
                                        '$phone',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),

                                      SizedBox(height: 40.0),
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
                                                  : 'Ubah Informasi Akun',
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
                                              Navigator.push(
                                                  context,
                                                  new MaterialPageRoute(
                                                      builder: (context) => Confirmpass()));
                                            },
                                        ),
                                      ),
                                      SizedBox(height: 1.0),
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
                                                  : 'Log Out',
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
                                          color: Color.fromRGBO(176, 40, 40, 1),
                                          disabledColor: Colors.grey,
                                          shape: new RoundedRectangleBorder(
                                              borderRadius:
                                              new BorderRadius.circular(
                                                  20.0)),
                                          onPressed: () {
                                            logout();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
        )
    );
  }

  void logout() async{
    var res = await Network().getData('/logout');
    var body = json.decode(res.body);
    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>Login()));
    }
  }
}