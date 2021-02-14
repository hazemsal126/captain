import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002087),
      bottomNavigationBar: Container(
        height: 90,
        child:  Column(
          children: [
            Row(
              children: [
                Expanded(
                  child:  Container(
                    height: 43.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1,color: Colors.grey)
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        'تسجيل الدخول',
                        style: GoogleFonts.cairo(
                          fontSize: 15.0,
                          color: const Color(0xFF002087),
                          letterSpacing: -0.3,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child:  Container(
                    height: 43.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1,color: Colors.grey)
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        'تسجيل العضوية',
                        style: GoogleFonts.cairo(
                          fontSize: 15.0,
                          color: const Color(0xFF002087),
                          letterSpacing: -0.3,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Container(
                height: 43.0,
                color: const Color(0xFF002087),
                child:Text(
                  'تسجيل العضوية لاحقا',
                  style: GoogleFonts.cairo(
                    fontSize: 15.0,
                    color: Colors.white,
                    letterSpacing: -0.3,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ) ,
              ),
            ),
          ],
        ),
      ),

      body: ListView(
        children: [
          SizedBox(height: 90,),
          Image.asset('images/logo.png',width: 116,height: 119,),
          SizedBox(height: 20,),
          Text(
            'كن لاعباً بصفات القائد',
            style: GoogleFonts.cairo(
              fontSize: 20.0,
              color: Colors.white,
              letterSpacing: -0.4,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40,),

          Container(
            child:
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  verticalDirection: VerticalDirection.up,
                  children: [
                    SizedBox(height: 70,),
                    Image.asset('images/lite.png'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  verticalDirection: VerticalDirection.up,
                  children: [
                    Image.asset('images/Luncherpsd.png',fit: BoxFit.none,),

                  ],
                )
              ],
            )
            ,
          ),
        ],
      ),

    );
  }
}
