import 'package:flutter/material.dart';

class CreateTabunganScreen extends StatefulWidget{
  @override
  _CreateTabunganScreenState createState() => _CreateTabunganScreenState();
}

class _CreateTabunganScreenState extends State<CreateTabunganScreen> {
  Color orange = const Color.fromRGBO(244, 144, 31, 1);
  Color field = const Color.fromRGBO(227, 238, 240, 1);

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
                                  'Rencana Tabungan',
                                  style: const TextStyle(
                                    color: Color.fromRGBO(244, 144, 31, 1),
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.012),
                                Text(
                                  'Yuk Bikin Rencana Tabunganmu !',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
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
                          margin: EdgeInsets.only(top: 15),
                          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 30.0),
                          child: Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Nama Tabungan',
                                        style: TextStyle(
                                          fontSize: 15,
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
                                          padding: const EdgeInsets.symmetric(horizontal: 15),
                                          child: TextFormField(
                                            style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            cursorColor: Color(0xFF9b9b9b),
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              hintText: "Nama Tabungan Anda",
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
                                            validator: (namaTabunganValue) {
                                              if (namaTabunganValue.isEmpty) {
                                                return 'Please enter some text';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(top:10),
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Deskripsi (optional)',
                                        style: TextStyle(
                                          fontSize: 15,
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
                                          padding: const EdgeInsets.symmetric(horizontal: 15),
                                          child: TextFormField(
                                            style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            cursorColor: Color(0xFF9b9b9b),
                                            keyboardType: TextInputType.multiline,
                                            minLines: 5,
                                            maxLines: 5,
                                            maxLength: 50,
                                            decoration: InputDecoration(
                                              hintText: "Deskripsi",
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
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(top:10),
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Target Tabungan',
                                        style: TextStyle(
                                          fontSize: 15,
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
                                          padding: const EdgeInsets.symmetric(horizontal: 15),
                                          child: TextFormField(
                                            style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            cursorColor: Color(0xFF9b9b9b),
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              hintText: "Masukkan Nominal Target Tabungan Anda",
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
                                            validator: (namaTabunganValue) {
                                              if (namaTabunganValue.isEmpty) {
                                                return 'Please enter some text';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(top:10),
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Target Tabungan',
                                        style: TextStyle(
                                          fontSize: 15,
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
                                          padding: const EdgeInsets.symmetric(horizontal: 15),
                                          child: TextFormField(
                                            style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            cursorColor: Color(0xFF9b9b9b),
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              hintText: "Masukkan Nominal Target Tabungan Anda",
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
                                            validator: (namaTabunganValue) {
                                              if (namaTabunganValue.isEmpty) {
                                                return 'Please enter some text';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
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
}