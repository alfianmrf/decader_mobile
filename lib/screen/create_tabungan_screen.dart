import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateTabunganScreen extends StatefulWidget{
  @override
  _CreateTabunganScreenState createState() => _CreateTabunganScreenState();
}

class _CreateTabunganScreenState extends State<CreateTabunganScreen> {
  final _formKey = GlobalKey<FormState>();
  Color orange = const Color.fromRGBO(244, 144, 31, 1);
  Color field = const Color.fromRGBO(227, 238, 240, 1);

  //image picker
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

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
                            key: _formKey,
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
                                  margin: EdgeInsets.only(top:15),
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Deskripsi',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: orange,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context).size.width* 0.5,
                                            child: Card(
                                              elevation: 0.0,
                                              color: Colors.white,
                                              margin: EdgeInsets.only(top:5),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                                child: Flexible(
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
                                                    validator: (desTabunganValue) {
                                                      if (desTabunganValue.isEmpty) {
                                                        return 'Please enter some text';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 120,
                                            height: 120,
                                            child: Stack(
                                              children: <Widget>[
                                                CircleAvatar(
                                                  radius: 80.0,
                                                  backgroundColor: Colors.white,
                                                  backgroundImage: _imageFile == null
                                                  ? AssetImage("images/person.png") : FileImage(File(_imageFile.path)),
                                                ),
                                                Positioned(
                                                  bottom: 6.0,
                                                  right: 4.0,
                                                  child: InkWell(
                                                    onTap: (){
                                                      showModalBottomSheet(
                                                          context: context,
                                                          builder: ((builder) => bottomSheet()),
                                                      );
                                                    },
                                                    child: Icon(
                                                      Icons.camera_alt,
                                                      color: orange,
                                                      size: 35,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(top:15),
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
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                'Rp',
                                                style: TextStyle(
                                                  fontSize: 15,
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
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(top:15),
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Frekuensi',
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
                                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                          child: Container(
                                            width: double.infinity,
                                            child: Text(
                                                'Bulanan',
                                                style: TextStyle(
                                                  color: Color(0xFF000000),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                          ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(top:15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Lama Menabung',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: orange,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                            width: MediaQuery.of(context).size.width * 0.38,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
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
                                                        color: orange,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  '11 Jan 2021',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black87,
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
                                              color: Colors.white,
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
                                                        color: orange,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  '21 Jan 2023',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 30.0),
                                ButtonTheme(
                                  minWidth: double.infinity,
                                  child : FlatButton(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 10, bottom: 10, left: 10, right: 10),
                                      child: Text(
                                        'Simpan',
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
                                      }
                                    },
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

  Widget bottomSheet(){
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile Photo",
            style:TextStyle(
              fontSize: 20.0,
              color: orange,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.camera),
                onPressed: (){
                  takePhoto(ImageSource.camera);
                },
                label: Text("Camera"),
              ),

              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: (){
                  takePhoto(ImageSource.gallery);
                },
                label: Text("Gallery"),
              ),
            ],
          )
        ],
      ),
    );
  }

  //method ambil foto
  void takePhoto(ImageSource source) async{
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
  }
}