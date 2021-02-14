import 'dart:ui';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:captain/helpers/database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Drawerc extends StatefulWidget {
  @override
  _DrawercState createState() => _DrawercState();
}

class _DrawercState extends State<Drawerc> {
  var _n;
  var _apptoken;
  var _user='';
  var email='';
  var img=DataBase.urlstatename()+'/upload/no-image.png';

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.get('auth') ?? false;
    

    final apptoken = prefs.get('apptoken') ?? 0;

    if(value){
      setState(() {
        _n = 1;
        _apptoken=apptoken;
        _user=prefs.get('username');
        email=prefs.get('email');
        img=prefs.get('img');
      });
    }
    else{
      setState(() {
        _n = 0;
        _apptoken=apptoken;
      });
    }
  }

  @override
  initState(){
    read();
  }

  Widget build(BuildContext context) {

    return  Drawer(

        child: Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent[700].withAlpha(150).withOpacity(.2),
            ),
        child:
        BlurryContainer(
          bgColor: const Color(0xFF002087).withAlpha(5).withOpacity(.5),
            child:  ListView(
                  children: <Widget>[
                    SizedBox(height: 5,),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: 84.0,
                            height: 84.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage('${img}'),
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                width: 1.0,
                                color: const Color(0xFFF2C046),
                              ),
                            ),
                          ),
                          Text(
                            '${_user}',
                            style: GoogleFonts.cairo(
                              fontSize: 16.0,
                              color: Colors.white,
                              letterSpacing: -0.32,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '${email}',
                            style: GoogleFonts.cairo(
                              fontSize: 16.0,
                              color: Colors.white,
                              letterSpacing: -0.32,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),

                    InkWell(
                      onTap: () {},
                      child:
                      SizedBox(
                        height: 40.0,
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 50,),
                            Container(
                                alignment: Alignment(0.24, 0.0),
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color(0xFFF2C046),
                                ),
                                child: Icon(FontAwesomeIcons.userEdit,color: Colors.white,size: 15,),
                              ),
                            SizedBox(width: 10,),
                            Text(
                              'الملاعب',
                              style: GoogleFonts.cairo(
                                fontSize: 18.0,
                                color: const Color(0xFFF2C046),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                      },
                      child:
                      SizedBox(
                        height: 40.0,
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 50,),
                            Container(
                                alignment: Alignment(0.24, 0.0),
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color(0xFFF2C046),
                                ),
                                child: Icon(FontAwesomeIcons.userEdit,color: Colors.white,size: 15,),
                              ),
                            SizedBox(width: 10,),
                            Text(
                              'الأكاديميات',
                              style: GoogleFonts.cairo(
                                fontSize: 18.0,
                                color: const Color(0xFFF2C046),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {},
                      child:
                      SizedBox(
                        height: 40.0,
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 50,),
                            Container(
                              alignment: Alignment(0.24, 0.0),
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFF2C046),
                              ),
                              child: Icon(FontAwesomeIcons.userEdit,color: Colors.white,size: 15,),
                            ),
                            SizedBox(width: 10,),
                            Text(
                              'الملفات الشخصية للاعبين',
                              style: GoogleFonts.cairo(
                                fontSize: 18.0,
                                color: const Color(0xFFF2C046),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      child:
                      SizedBox(
                        height: 40.0,
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 50,),
                            Container(
                              alignment: Alignment(0.24, 0.0),
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFF2C046),
                              ),
                              child: Icon(FontAwesomeIcons.userEdit,color: Colors.white,size: 15,),
                            ),
                            SizedBox(width: 10,),
                            Text(
                              'الملف الشخصي',
                              style: GoogleFonts.cairo(
                                fontSize: 18.0,
                                color: const Color(0xFFF2C046),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child:
                      SizedBox(
                        height: 40.0,
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 50,),
                            Container(
                              alignment: Alignment.center,
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFF2C046),
                              ),
                              child: Icon(FontAwesomeIcons.userFriends,color: Colors.white,size: 15,),
                            ),
                            SizedBox(width: 10,),
                            Text(
                              'الأصدقاء',
                              style: GoogleFonts.cairo(
                                fontSize: 18.0,
                                color: const Color(0xFFF2C046),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child:
                      SizedBox(
                        height: 40.0,
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 50,),
                            Container(
                              alignment: Alignment.center,
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFF2C046),
                              ),
                              child: Icon(FontAwesomeIcons.commentDots,color: Colors.white,size: 15,),
                            ),
                            SizedBox(width: 10,),
                            Text(
                              'اتصل بنا',
                              style: GoogleFonts.cairo(
                                fontSize: 18.0,
                                color: const Color(0xFFF2C046),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child:
                      SizedBox(
                        height: 40.0,
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 50,),
                            Container(
                              alignment: Alignment.center,
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFF2C046),
                              ),
                              child: Icon(FontAwesomeIcons.question,color: Colors.white,size: 15,),
                            ),
                            SizedBox(width: 10,),
                            Text(
                              'من نحن',
                              style: GoogleFonts.cairo(
                                fontSize: 18.0,
                                color: const Color(0xFFF2C046),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child:
                      SizedBox(
                        height: 40.0,
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 50,),
                            Container(
                              alignment: Alignment.center,
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFF2C046),
                              ),
                              child: Icon(FontAwesomeIcons.shareAlt,color: Colors.white,size: 15,),
                            ),
                            SizedBox(width: 10,),
                            Text(
                              'شارك التطبيق',
                              style: GoogleFonts.cairo(
                                fontSize: 18.0,
                                color: const Color(0xFFF2C046),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child:
                      SizedBox(
                        height: 40.0,
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 50,),
                            Container(
                              alignment: Alignment.center,
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFF2C046),
                              ),
                              child: Icon(Icons.star,color: Colors.white,size: 15,),
                            ),
                            SizedBox(width: 10,),
                            Text(
                              'تقييم التطبيق',
                              style: GoogleFonts.cairo(
                                fontSize: 18.0,
                                color: const Color(0xFFF2C046),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: _logouts,
                      child:
                      SizedBox(
                        height: 40.0,
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 50,),
                            Container(
                              alignment: Alignment.center,
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFF2C046),
                              ),
                              child: Icon(Icons.logout,color: Colors.white,size: 15,),
                            ),
                            SizedBox(width: 10,),
                            Text(
                              'تسجيل الخروج',
                              style: GoogleFonts.cairo(
                                fontSize: 18.0,
                                color: const Color(0xFFF2C046),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),


                    Divider(
                      indent: 25,
                      endIndent: 25,
                      color:const Color(0xffffffff) ,
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment(0.04, 0.01),
                            width: 37.0,
                            height: 32.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Image.asset('images/twitter.png'),
                            ),
                          ),
                          Container(
                            alignment: Alignment(0.04, 0.01),
                            width: 37.0,
                            height: 32.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Image.asset('images/instagram.png'),
                            ),
                          ),
                          Container(
                            alignment: Alignment(0.04, 0.01),
                            width: 37.0,
                            height: 32.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Image.asset('images/facebook.png'),
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 25,),
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white,width: 2),
                          ),
                          child: Center(
                            child: Icon(Icons.close,size: 20,color: Colors.white,),
                          ),
                        ),
                      ),
                    )

                  ],
                ),

        )
        )
    );
  }

  _logouts() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    prefs.remove(key);
    prefs.remove('auth');
    Navigator.pushNamed(context, '/login');
  }
}
