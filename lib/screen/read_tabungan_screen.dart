import 'dart:convert';

import 'package:decader/network_utils/api.dart';
import 'package:decader/screen/home.dart';
import 'package:decader/screen/edit_tabungan_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReadTabunganScreen extends StatefulWidget{
  Map detail;

  ReadTabunganScreen(this.detail);

  @override
  _ReadTabunganScreenState createState() => _ReadTabunganScreenState();
}

class _ReadTabunganScreenState extends State<ReadTabunganScreen> {
  TextEditingController tabunganController = new TextEditingController();
  Color orange = const Color.fromRGBO(244, 144, 31, 1);
  Color field = const Color.fromRGBO(0, 106, 128, 1);
  final String _url = 'https://decader.000webhostapp.com';
  final _formKey = GlobalKey<FormState>();
  int tabung;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: Color.fromRGBO(12, 60, 70, 1),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(10.0, 50.0, 20.0, 30.0),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 106, 128, 1),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40.0)
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                              color: Colors.white,
                            ),
                            onTap: (){
                              Navigator.pop(context,true);
                            },
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: screenHeight * 0.03),
                                Text(
                                  'Rencana Tabunganmu',
                                  style: const TextStyle(
                                    color: Color.fromRGBO(244, 144, 31, 1),
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Text(
                                  widget.detail['title'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Target',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.005),
                                    Text(
                                      NumberFormat.simpleCurrency(locale: "id_ID",decimalDigits: 0 ).format(widget.detail['target_total']),
                                      style: TextStyle(
                                        color: Color.fromRGBO(244, 144, 31, 1),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: SingleChildScrollView(
                         child: Container(
                           padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 30.0),
                           child: Column(
                             children: <Widget>[
                               Container(
                                 margin: EdgeInsets.only(top:20),
                                 child: Column(
                                   children: <Widget>[
                                     Container(
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         children: <Widget>[
                                           Container(
                                             width: 60,
                                             height: 60,
                                             child: CircleAvatar(
                                               backgroundColor: Colors.white,
                                               foregroundColor: Colors.white,
                                               backgroundImage: NetworkImage(_url+widget.detail['image']),
                                             ),
                                           ),
                                           SizedBox(width: 20),
                                           Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: <Widget>[
                                               Text(
                                                 'Saldo Sementara',
                                                 style: TextStyle(
                                                   fontSize: 16,
                                                   fontWeight: FontWeight.w500,
                                                   color: Colors.white,
                                                 ),
                                               ),
                                               SizedBox(height: 0.005),
                                               Text(
                                                 NumberFormat.simpleCurrency(locale: "id_ID",decimalDigits: 0 ).format(widget.detail['current_save']),
                                                 style: TextStyle(
                                                   fontSize: 26,
                                                   fontWeight: FontWeight.w500,
                                                   color: orange,
                                                 ),
                                               ),
                                             ],
                                           )
                                         ],
                                       ),
                                     ),
                                   ],
                                 ),
                               ),

                               Container(
                                 margin: EdgeInsets.only(top:20, bottom: 8),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: <Widget>[
                                     Container(
                                       padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                       width: MediaQuery.of(context).size.width * 0.38,
                                       decoration: BoxDecoration(
                                         color: field,
                                         borderRadius: BorderRadius.all(Radius.circular(15)),
                                       ),
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         children: <Widget>[
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.start,
                                             crossAxisAlignment: CrossAxisAlignment.center,
                                             children: <Widget>[
                                               Icon(
                                                 Icons.calendar_today,
                                                 color: orange,
                                                 size: 17,
                                               ),
                                               SizedBox(width: 5),
                                               Text(
                                                 'Start Date',
                                                 style: TextStyle(
                                                   fontSize: 13,
                                                   fontWeight: FontWeight.w500,
                                                   color: Colors.white,
                                                 ),
                                               ),
                                             ],
                                           ),
                                           SizedBox(height: 10),
                                           Text(
                                             widget.detail['created_at'].substring(0,10),
                                             style: TextStyle(
                                               fontSize: 18,
                                               fontWeight: FontWeight.w600,
                                               color: orange,
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                     Text(
                                       'To',
                                       style: TextStyle(
                                         color: orange,
                                         fontSize: 18,
                                         fontWeight: FontWeight.w500,
                                       ),
                                     ),
                                     Container(
                                       padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                       width: MediaQuery.of(context).size.width * 0.38,
                                       decoration: BoxDecoration(
                                         color: field,
                                         borderRadius: BorderRadius.all(Radius.circular(15)),
                                       ),
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         children: <Widget>[
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.start,
                                             crossAxisAlignment: CrossAxisAlignment.center,
                                             children: <Widget>[
                                               Icon(
                                                 Icons.calendar_today,
                                                 color: orange,
                                                 size: 17,
                                               ),
                                               SizedBox(width: 5),
                                               Text(
                                                 'End Date',
                                                 style: TextStyle(
                                                   fontSize: 13,
                                                   fontWeight: FontWeight.w500,
                                                   color: Colors.white,
                                                 ),
                                               ),
                                             ],
                                           ),
                                           SizedBox(height: 10),
                                           Text(
                                             widget.detail['target_date'],
                                             style: TextStyle(
                                               fontSize: 18,
                                               fontWeight: FontWeight.w600,
                                               color: orange,
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                               SizedBox(height: 1),
                               Text(
                                 'Rencana : '+NumberFormat.simpleCurrency(locale: "id_ID",decimalDigits: 0 ).format(widget.detail['plan'])+' / bulan',
                                 style: TextStyle(
                                     fontSize: 13,
                                     fontWeight: FontWeight.w300,
                                     color: Colors.white
                                 ),
                               ),
                               SizedBox(height: 5),
                               Container(
                                 width: MediaQuery.of(context).size.width,
                                 height: MediaQuery.of(context).size.width * 0.2,
                                 padding: EdgeInsets.all(10),
                                 decoration: BoxDecoration(
                                   color: field,
                                   borderRadius: BorderRadius.all(Radius.circular(15)),
                                 ),
                                 child: Text(
                                   widget.detail['description'],
                                   style: TextStyle(
                                       fontSize: 13,
                                       fontWeight: FontWeight.w300,
                                       color: Colors.white
                                   ),
                                 ),
                               ),
                               SizedBox(height: 15),
                               Container(
                                 width: MediaQuery.of(context).size.width,
                                 child: Form(
                                   key: _formKey,
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[
                                       Text(
                                         'Tabung Hari Ini',
                                         style: TextStyle(
                                           fontSize: 16,
                                           fontWeight: FontWeight.w600,
                                           color: orange,
                                         ),
                                       ),
                                       Card(
                                         elevation: 0.0,
                                         color: Colors.white,
                                         margin: EdgeInsets.only(top:5),
                                         shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(15)
                                         ),
                                         child: Padding(
                                             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                             child: Form(
                                                 child: Row(
                                                   children: <Widget>[
                                                     Text(
                                                       'Rp',
                                                       style: TextStyle(
                                                         fontSize: 18,
                                                         color: Colors.black87,
                                                         fontWeight: FontWeight.w600,
                                                       ),
                                                     ),
                                                     Container(
                                                       color: Colors.black54,
                                                       width: 2,
                                                       height: MediaQuery.of(context).size.height * 0.03,
                                                       margin: EdgeInsets.symmetric(horizontal: 5),
                                                     ),

                                                     Flexible(
                                                       child: TextFormField(
                                                         controller: tabunganController,
                                                         style: TextStyle(
                                                           color: Color(0xFF000000),
                                                           fontSize: 18,
                                                           fontWeight: FontWeight.w600,
                                                         ),
                                                         cursorColor: Color(0xFF9b9b9b),
                                                         keyboardType: TextInputType.number,
                                                         decoration: InputDecoration(
                                                           hintText: "Isi Nominal Uang",
                                                           hintStyle: TextStyle(
                                                               color: Color(0xFF9b9b9b),
                                                               fontSize: 13,
                                                               fontWeight: FontWeight.w500),
                                                           border: InputBorder.none,
                                                           focusedBorder: InputBorder.none,
                                                           enabledBorder: InputBorder.none,
                                                           errorBorder: InputBorder.none,
                                                           disabledBorder: InputBorder.none,
                                                         ),
                                                         validator: (moneyValue) {
                                                           if (moneyValue.isEmpty) {
                                                             return 'Please enter some text';
                                                           }
                                                           return null;
                                                         },
                                                       ),
                                                     ),
                                                   ],
                                                 )
                                             )
                                         ),
                                       ),
                                       SizedBox(height: 10),
                                       ButtonTheme(
                                         minWidth: double.infinity,
                                         child : FlatButton(
                                           child: Padding(
                                             padding: EdgeInsets.only(
                                                 top: 10, bottom: 10, left: 10, right: 10),
                                             child: Text(
                                               'Tabung',
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
                                               print(tabung);
                                               _save();
                                             }
                                           },
                                         ),
                                       ),
                                       SizedBox(height: 1),
                                       ButtonTheme(
                                         minWidth: double.infinity,
                                         child : FlatButton(
                                           child: Padding(
                                             padding: EdgeInsets.only(
                                                 top: 10, bottom: 10, left: 10, right: 10),
                                             child: Text(
                                               'Edit',
                                               style: TextStyle(
                                                 color: Colors.white,
                                                 fontSize: 15.0,
                                                 decoration: TextDecoration.none,
                                                 fontWeight: FontWeight.bold,
                                               ),
                                             ),
                                           ),
                                           color: Colors.green,
                                           disabledColor: Colors.grey,
                                           shape: new RoundedRectangleBorder(
                                               borderRadius:
                                               new BorderRadius.circular(20.0)),
                                           onPressed: () {
                                             Navigator.push(
                                                 context,
                                                 new MaterialPageRoute(
                                                     builder: (context) => EditTabunganScreen(widget.detail)));
                                           },
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                               )
                             ],
                           ),
                         ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _save()async{
    var data = {
      'id' : widget.detail['id'],
      'current_save': widget.detail['current_save']+int.parse(tabunganController.text)
    };

    var res = await Network().authData(data, '/save');
    var body = json.decode(res.body);
    if(body['success']==true){
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => Home()
        ),
      );
    }
    else if(body['success']==false){
      print("GAGAL");
    }
    else{
      print(body);
    }
  }
}