import 'dart:convert';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:decader/network_utils/api.dart';
import 'package:decader/screen/create_tabungan_screen.dart';
import 'package:decader/screen/login.dart';
import 'package:decader/screen/read_tabungan_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatefulWidget{
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin{
  String name, cektoken;
  int totalTabungan = 0;
  List namaTabungan = ["Tabungan Anak Sekolah", "Tabungan Haji", "Tabungan Motor", "Tabungan Liburan", "Tabungan Umroh"];
  List tabunganTercapai = ["Tabungan Kuliah", "Tabungan Pergi", "Tabungan Mobil", "Tabungan Holiday", "Tabungan Umroh"];
  List durasiTabungan = ["Bulanan", "Mingguan", "Bulanan", "Bulanan", "Bulanan"];
  List isiTabungan = ["200.000/\n10.000.000", "200.000/\n10.000.000", "200.000/\n10.000.000", "200.000/\n10.000.000", "200.000/\n10.000.000"];
  Color orange = const Color.fromRGBO(244, 144, 31, 1);
  final String _url = 'https://decader.000webhostapp.com';

  TabController _pindahTab;
  @override
  void initState(){
    _pindahTab = new TabController(length: 2, vsync: this);
    _loadUserData();
    super.initState();
  }

  @override
  void dispose(){
    _pindahTab.dispose();
    super.dispose();
  }

  _loadUserData() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));
    var token = jsonDecode(localStorage.getString('token'));

    if(user != null) {
      setState(() {
        name = user['fname'];
        cektoken = token['token'];
      });
    }
  }

  List data;

  _loadSavesData() async{
    var res = await Network().getData('/read');
    var body = json.decode(res.body);
    if(body['success']){
      Map<String, dynamic> map;
      map = json.decode(res.body);

      data = map["data"];
      print(data);
      for(var i = 0; i < data.length; i++){
        totalTabungan += data[i]['current_save'];
      }
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: Color.fromRGBO(12, 60, 70, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 45.0, 20.0, 30.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 106, 128, 1),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0)
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Hai $name',
                          style: const TextStyle(
                            color: Color.fromRGBO(244, 144, 31, 1),
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                )
                            ),
                            child : GestureDetector(
                              onTap: (){
                                logout();
                              },
                              child: Image(
                                image: NetworkImage("https://images.unsplash.com/photo-1608833970687-99bc4f54898d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80"),
                              ),
                            )
                        )
                      ]
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Total Tabungan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        NumberFormat.simpleCurrency(locale: "id_ID",decimalDigits: 0 ).format(totalTabungan)??'Rp. 0',
                        style: TextStyle(
                          color: Color.fromRGBO(244, 144, 31, 1),
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ButtonTheme(
                minWidth: double.infinity,
                child: FlatButton(
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Image.asset(
                            'images/wallet.png',
                            height: 35,
                            width: 35,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'Buat Rencana Tabungan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                  ),
                  color: orange,
                  disabledColor: Colors.grey,
                  shape: new RoundedRectangleBorder(
                      borderRadius:
                      new BorderRadius.circular(10.0)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => CreateTabunganScreen()));
                  },
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top:20),
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Rencana Tabungan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.orange,
                ),
              ),
            ),

            DefaultTabController(
              length: 2,
              child: Container(
                margin: const EdgeInsets.only(top: 10.0, bottom: 10, left: 20, right: 20),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: TabBar(
                  controller: _pindahTab,
                  indicator: BubbleTabIndicator(
                    tabBarIndicatorSize: TabBarIndicatorSize.tab,
                    indicatorHeight: 40,
                    indicatorColor: Colors.orange
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.orange,
                  tabs: [
                    Text('Tabungan Saat Ini'),
                    Text('Tabungan Tercapai'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _pindahTab,
                children: <Widget>[
                  FutureBuilder(
                    future: _loadSavesData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data);
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) => Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                            child: Card(
                              elevation: 0.0,
                              color: Color.fromRGBO(16, 76, 88, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(builder: (context) => ReadTabunganScreen(data[index])));
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width: 35,
                                              height: 35,
                                              child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                foregroundColor: Colors.white,
                                                backgroundImage: NetworkImage(_url+data[index]['image']),
                                              ),
                                            ),
                                            SizedBox(width: 5.0),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    data[index]['title'],
                                                    style: TextStyle(
                                                        color: Colors.orange,
                                                        fontSize: 15.0,
                                                        fontWeight: FontWeight.w600
                                                    ),
                                                  ),
                                                  SizedBox(height: 2),
                                                  Text(
                                                    NumberFormat.simpleCurrency(locale: "id_ID",decimalDigits: 0 ).format(data[index]['plan'])+' / bulan',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 11.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 100,
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          NumberFormat.simpleCurrency(locale: "id_ID",decimalDigits: 0 ).format(data[index]['current_save'])+' / '+NumberFormat.simpleCurrency(locale: "id_ID",decimalDigits: 0 ).format(data[index]['target_total']),
                                          style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Center (
                            child: CircularProgressIndicator()
                        );
                      }
                    },
                  ),
                  ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) => Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                      child: Card(
                        elevation: 0.0,
                        color: Color.fromRGBO(16, 76, 88, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 35,
                                    height: 35,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.white,
                                      backgroundImage: NetworkImage("https://images.unsplash.com/photo-1608833970687-99bc4f54898d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80"),
                                    ),
                                  ),
                                  SizedBox(width: 5.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        tabunganTercapai[index],
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        durasiTabungan[index],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.0,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Tercapai !',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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