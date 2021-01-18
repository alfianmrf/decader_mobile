import 'dart:convert';
import 'dart:io';
import 'package:decader/network_utils/api.dart';
import 'package:decader/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditTabunganScreen extends StatefulWidget{
  Map save;

  EditTabunganScreen(this.save);

  @override
  _EditTabunganScreenState createState() => _EditTabunganScreenState();
}

class _EditTabunganScreenState extends State<EditTabunganScreen> {
  final _formKey = GlobalKey<FormState>();
  final String _url = 'https://decader.000webhostapp.com';
  final String _urlAPI = 'https://decader.000webhostapp.com/api/v1';
  Color orange = const Color.fromRGBO(244, 144, 31, 1);
  Color field = const Color.fromRGBO(227, 238, 240, 1);
  TextEditingController titleController = new TextEditingController();
  TextEditingController planController = new TextEditingController();
  TextEditingController targetTotalController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  String title, description;
  int plan, targetTotal;
  DateTime selectedDate = DateTime.now();
  bool updateDate = false;

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
                                  'Edit Rencana Tabunganmu !',
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
                                              // controller: titleController,
                                              initialValue: widget.save['title'],
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
                                                title = namaTabunganValue;
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
                                                      // controller: descriptionController,
                                                      initialValue: widget.save['description'],
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
                                                        description = desTabunganValue;
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
                                                        ? NetworkImage(_url+widget.save['image']) : FileImage(File(_imageFile.path)),
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
                                                    // controller: targetTotalController,
                                                    initialValue: widget.save['target_total'].toString(),
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
                                                    validator: (targetTabunganValue) {
                                                      if (targetTabunganValue.isEmpty) {
                                                        return 'Please enter some text';
                                                      }
                                                      targetTotal = int.parse(targetTabunganValue);
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
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
                                          'Rencana Tabungan (per bulan)',
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
                                                    // controller: planController,
                                                    initialValue: widget.save['plan'].toString(),
                                                    style: TextStyle(
                                                      color: Color(0xFF000000),
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                    cursorColor: Color(0xFF9b9b9b),
                                                    keyboardType: TextInputType.number,
                                                    decoration: InputDecoration(
                                                      hintText: "Masukkan Nominal Rencana Tabungan Anda",
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
                                                    validator: (rencanaTabunganValue) {
                                                      if (rencanaTabunganValue.isEmpty) {
                                                        return 'Please enter some text';
                                                      }
                                                      plan = int.parse(rencanaTabunganValue);
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                              ],
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
                                                    widget.save['created_at'].substring(0,10),
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
                                            GestureDetector(
                                              onTap: () => _selectDate(context),
                                              child: Container(
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
                                                      updateDate ? "${selectedDate.toLocal()}".split(' ')[0] : widget.save['target_date'],
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                  ],
                                                ),
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
                                          'Perbarui',
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
                                          _editImage();
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
                                          'Hapus',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      color: Color.fromRGBO(176, 40, 40, 1),
                                      disabledColor: Colors.grey,
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                          new BorderRadius.circular(20.0)),
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          _delete();
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

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        updateDate = true;
      });
  }

  void _edit()async{
    var data = {
      'id' : widget.save['id'],
      'title' : title,
      'plan' : plan,
      'target_date' : "${selectedDate.toLocal()}".split(' ')[0],
      'target_total' : targetTotal,
      'description': description,
    };

    var res = await Network().authData(data, '/update');
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
      print(_imageFile.path.split("/").last);
    }
    else{
      print("Error");
      print(body);
    }
  }

  _editImage() async{
    final request = http.MultipartRequest('POST', Uri.parse(_urlAPI+'/update'));

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = jsonDecode(localStorage.getString('token'))['token'];
    Map<String, String> headers = {
      'Content-type' : 'application/json',
      'Accept' : 'application/json',
      "Authorization": "Bearer $token"
    };

    request.fields['id'] = widget.save['id'].toString();
    request.fields['title'] = title;
    request.fields['plan'] = plan.toString();
    request.fields['target_date'] = "${selectedDate.toLocal()}".split(' ')[0];
    request.fields['target_total'] = targetTotal.toString();
    request.fields['description'] = description;
    request.headers.addAll(headers);

    if(_imageFile != null){
      final imgSave = await http.MultipartFile.fromPath('image', _imageFile.path);
      request.files.add(imgSave);
    }

    final streamedResponse = await request.send();

    try{
      final response = await http.Response.fromStream(streamedResponse);
      if(response.statusCode == 200){
        Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => Home()
          ),
        );
      }
      else{
        throw Exception('Failed to add save');
      }
    }
    catch(e){
      print(e);
    }
  }

  void _delete()async{
    var data = {
      'id' : widget.save['id'],
    };

    var res = await Network().authData(data, '/delete');
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