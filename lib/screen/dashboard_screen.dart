import 'dart:convert';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:decader/network_utils/api.dart';
import 'package:decader/screen/create_tabungan_screen.dart';
import 'package:decader/screen/login.dart';
import 'package:decader/screen/read_tabungan_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget{
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin{
  String name;
  List namaTabungan = ["Tabungan Anak Sekolah", "Tabungan Haji", "Tabungan Motor", "Tabungan Liburan", "Tabungan Umroh"];
  List tabunganTercapai = ["Tabungan Kuliah", "Tabungan Pergi", "Tabungan Mobil", "Tabungan Holiday", "Tabungan Umroh"];
  List durasiTabungan = ["Bulanan", "Mingguan", "Bulanan", "Bulanan", "Bulanan"];
  List isiTabungan = ["200.000/\n10.000.000", "200.000/\n10.000.000", "200.000/\n10.000.000", "200.000/\n10.000.000", "200.000/\n10.000.000"];
  Color orange = const Color.fromRGBO(244, 144, 31, 1);

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

    if(user != null) {
      setState(() {
        name = user['fname'];
      });
    }
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
                            child : Image(
                              image: NetworkImage("https://images.unsplash.com/photo-1608833970687-99bc4f54898d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80"),
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
                        'Rp 100.000.000',
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
                            textDirection: TextDirection.ltr,
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
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                new MaterialPageRoute(builder: (context) => ReadTabunganScreen()));
                          },
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
                                          namaTabungan[index],
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
                                    isiTabungan[index],
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