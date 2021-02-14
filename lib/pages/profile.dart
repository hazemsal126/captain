import 'package:captain/helpers/database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:async/async.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  DataBase dataBase = new DataBase();
  String msgStatus = '';
  int s=1;
  var _img;

  File _image;
  final picker = ImagePicker();
  Future _getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getdatafeature(BuildContext context) async{
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.get('token') ?? 0;

    var url=DataBase.urlstatename()+'api/authuser?token='+value;
    final response = await http.get(url,
        headers: {
          "Accept": "application/json",
        });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final json = convert.jsonDecode(response.body);
      setState(() {
        s=1;
        _nameController.text=json['items']['name'];
        _emailController.text=json['items']['email'];
        _phoneController.text=json['items']['phone'];
        _img=json['items']['img'];
      });
    }
    else{
      Navigator.pushNamed(context, '/login');
    }
  }

  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  _onPressed() async{
    setState(() {
      s = 0;
    });
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.get('token') ?? 'null';
    String myUrl = DataBase.urlstatename()+'api/auth/update?token='+value;

    var uri = Uri.parse(myUrl);
    var request = http.MultipartRequest("POST", uri);
    request.headers['Accept']='application/json';
    request.fields['name'] = _nameController.text;
    request.fields['email'] = _emailController.text;
    request.fields['password'] = _passwordController.text;
    request.fields['phone'] = _phoneController.text;
    if(_image != null) {
      var stream = http.ByteStream(_image.openRead());
      var length = await _image.length();
      request.files.add(http.MultipartFile("img", stream.cast(), length,
          filename: path.basename(_image.path)));
    }
    http.Response response = await http.Response.fromStream(await request.send());

    var data = convert.jsonDecode(response.body);
    var status = data['status'];

    if (response.statusCode == 200) {
      setState(() {
        s = 1;
      });
      dataBase.toast_success('تمت العملية بنجاح');

    }else{
      setState(() {
        s = 1;
      });
      dataBase.toast_success('يوجد خطأ حاول مرة أخرى');
    }
  }
  @override

  void initState() {
    super.initState();
    getdatafeature(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
              height: 239,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [const Color(0xFFF2C046),const Color(0xFFE4AF3D),const Color(0xFFC78B2B)],begin: Alignment.topRight,
                  end: Alignment.bottomLeft,),
              ),

              child:

              Stack(
                alignment: Alignment.topRight,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: (){Navigator.pop(context);},
                      child: Padding(padding: EdgeInsets.all(15),
                          child: Icon(Icons.arrow_back_ios_outlined,size: 17,color: Colors.white,)
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child:Padding(padding: EdgeInsets.only(top: 6),
                    child:  Text(
                      'تعديل الملف الشخصي',
                      style: GoogleFonts.cairo(
                        fontSize: 18.0,
                        color: Colors.white,
                        letterSpacing: -0.36,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    )

                  ),

                  Align(
                    alignment: Alignment.center,
                    child: // Group: Group 157

                    SizedBox(
                      width: 108.0,
                      height: 104.0,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: 104.0,
                            height: 104.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: _image != null ? FileImage(_image) :NetworkImage('${_img}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 7.0,
                            child: InkWell(
                              onTap: _getImage,
                              child:  Container(
                                  alignment: Alignment(0.05, 0.0),
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xFF717171),
                                    border: Border.all(
                                      width: 2.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  child: Icon(Icons.image,color: Colors.white,size: 12,)
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                  )

                ],
              )

          ),
          SizedBox(height: 20,),

          Stack(

            children: [

              Align(
                  alignment: Alignment.center,
                  child:Column(
                    children: [
                      SizedBox(height: 5,),

                      Container(
                        height:330,
                        width: MediaQuery.of(context).size.width*80/100,
                        decoration: BoxDecoration(
                          boxShadow: [
                            new BoxShadow(
                              color:  const Color(0xFFE3E3E3).withOpacity(.90),
                              blurRadius: 15.0,
                            ),
                          ],
                        ),
                        child: new Card(
                            child: Column(
                              children: [
                                Container(
                                  height: 55,
                                  margin:  EdgeInsets.only(right: 30.0),
                                  child:TextField(
                                    controller: _nameController,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        labelText: ' الاسم الكامل',
                                        border: InputBorder.none,
                                        labelStyle: TextStyle(
                                            fontSize: 13
                                        )
                                    ),
                                  ),
                                ),
                                Padding(padding:EdgeInsets.symmetric(horizontal: 15),
                                  child: Divider(color: Colors.grey,),
                                ),
                                Container(
                                  height: 55,
                                  margin:  EdgeInsets.only(right: 30.0),
                                  child:TextField(
                                    controller: _emailController,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        labelText: 'البريد الإلكتروني',
                                        border: InputBorder.none,
                                        labelStyle: TextStyle(
                                            fontSize: 13
                                        )
                                    ),
                                  ),
                                ),
                                Padding(padding:EdgeInsets.symmetric(horizontal: 15),
                                  child: Divider(color: Colors.grey,),
                                ),
                                Container(
                                    height: 55,
                                    margin:  EdgeInsets.only(right: 30.0),
                                    child:Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width*58/100,
                                          child: TextField(
                                            controller: _phoneController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                labelText: 'رقم الهاتف',
                                                border: InputBorder.none,
                                                labelStyle: TextStyle(
                                                    fontSize: 13
                                                )
                                            ),
                                          ),
                                        ),

                                        Container(
                                          width: 39.0,
                                          height: 22.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4.0),
                                            color: const Color(0xFFE3E3E3),
                                          ),
                                          child: Center(
                                            child:
                                            Text(
                                              '+965',
                                              style: GoogleFonts.cairo(
                                                fontSize: 13.0,
                                                color: const Color(0xFF717171),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                                Padding(padding:EdgeInsets.symmetric(horizontal: 15),
                                  child: Divider(color: Colors.grey,),
                                ),
                                Container(
                                    height: 55,
                                    margin:  EdgeInsets.only(right: 30.0),
                                    child:Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width*58/100,
                                          child:  TextField(
                                            controller: _passwordController,
                                            keyboardType: TextInputType.text,
                                            obscureText: true,
                                            decoration: InputDecoration(
                                                labelText: 'كلمة المرور',
                                                border: InputBorder.none,
                                                labelStyle: TextStyle(
                                                    fontSize: 13
                                                )
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 39.0,
                                          height: 22.0,
                                          child: Center(
                                              child:
                                              Icon(Icons.remove_red_eye,size: 15,color: Color(0xFF717171),)
                                          ),
                                        ),

                                      ],
                                    )
                                ),
                                Padding(padding:EdgeInsets.symmetric(horizontal: 15),
                                  child: Divider(color: Colors.grey,),
                                ),

                              ],
                            )
                        ),
                      ),
                      SizedBox(height: 25,),
                      InkWell(
                        onTap: _onPressed,
                        child:
                        Container(
                            height: 43.0,
                            width: MediaQuery.of(context).size.width*45/100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22.0),
                              color: const Color(0xFFF2C046),
                            ),
                            child: Center(
                              child: Text(
                                'حفظ التغييرات',
                                style: GoogleFonts.cairo(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                        ),
                      )

                    ],
                  )


              ),


            ],
          ),

        ],
      ),
    );
  }
}
