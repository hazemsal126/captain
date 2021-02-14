import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderData extends StatefulWidget {
  @override
  _OrderDataState createState() => _OrderDataState();
}

class _OrderDataState extends State<OrderData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 3 / 100),
        children: [
          SizedBox(height: 30,),
          Row(
            children: [
              SizedBox(width: 7,),
              Text(
                'بيانات الطلب',
                style: GoogleFonts.cairo(
                  fontSize: 18.0,
                  color: const Color(0xFF002087),
                  letterSpacing: -0.36,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              Expanded(child: SizedBox()),
              IconButton(icon: Icon(Icons.arrow_back_sharp,color: Colors.black,size: 19,),
                  onPressed: (){Navigator.pop(context);}
              )
            ],
          ),
          SizedBox(height: 15,),

          Container(
            height: 180,
            child: Stack(
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 9),
                  child:  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0xFFF2C046).withOpacity(0.53)
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child:   Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child:   Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [

                      Container(
                        width: 139.0,
                        height: 33.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(8.0),
                          ),
                          color: const Color(0xFFF2C046),
                        ),
                        child: Text(
                          'بيانات الطفل',
                          style: GoogleFonts.cairo(
                            fontSize: 16.0,
                            color: Colors.white,
                            letterSpacing: -0.32,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 12,),
                      Container(
                        alignment: Alignment(0.76, -0.33),
                        width: 181.0,
                        height: 32.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.white,
                        ),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: ' الاسم الكامل',
                              border: InputBorder.none,
                              labelStyle: GoogleFonts.cairo(
                                fontSize: 14.0,
                                color: const Color(0xFFF2C046),
                                letterSpacing: -0.28,
                                fontWeight: FontWeight.w600,
                              ),
                            contentPadding: EdgeInsets.only(right: 10)

                          ),
                        ),
                      ),
                      SizedBox(height: 12,),
                      Container(
                        alignment: Alignment(0.76, -0.33),
                        width: 181.0,
                        height: 32.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.white,
                        ),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: ' الاسم الكامل',
                              border: InputBorder.none,
                              labelStyle: GoogleFonts.cairo(
                                fontSize: 14.0,
                                color: const Color(0xFFF2C046),
                                letterSpacing: -0.28,
                                fontWeight: FontWeight.w600,
                              ),
                              contentPadding: EdgeInsets.only(right: 10)

                          ),
                        ),
                      ),
                      SizedBox(height: 12,),
                      Container(
                        alignment: Alignment(0.76, -0.33),
                        width: 181.0,
                        height: 32.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.white,
                        ),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: 'العمر',
                              border: InputBorder.none,
                              labelStyle: GoogleFonts.cairo(
                                fontSize: 14.0,
                                color: const Color(0xFFF2C046),
                                letterSpacing: -0.28,
                                fontWeight: FontWeight.w600,
                              ),
                              contentPadding: EdgeInsets.only(right: 10)

                          ),
                        ),
                      ),
                    ],
                  )

                ),




              ],
            ),
          )
          // Group: Group 273

          /*SizedBox(
            height: 179.0,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                SizedBox(
                  height: 179.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        right: 9.0,
                        child: Container(
                          height: 179.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: const Color(0xFFF2C046).withOpacity(0.53)
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 79.0,
                        child: Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 79.0,
                        child: Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 51.0,
                  child:
// Group: Group 268
                  Container(
                    alignment: Alignment(0.76, -0.33),
                    width: 181.0,
                    height: 32.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white,
                    ),
                    child: Text(
                      'الإسم الكامل',
                      style: GoogleFonts.cairo(
                        fontSize: 14.0,
                        color: const Color(0xFFF2C046),
                        letterSpacing: -0.28,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16.0,
                  child:
// Group: Group 270
                  Container(
                    alignment: Alignment(0.8, -0.33),
                    width: 181.0,
                    height: 32.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white,
                    ),
                    child: Text(
                      'العمر',
                      style: GoogleFonts.cairo(
                        fontSize: 14.0,
                        color: const Color(0xFFF2C046),
                        letterSpacing: -0.28,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 56.0,
                  child:
// Group: Group 271

                  SizedBox(
                    width: 181.0,
                    height: 32.0,
                    child: Stack(
                      children: <Widget>[
// Group: Group 269
                        Container(
                          alignment: Alignment(0.82, -0.33),
                          width: 181.0,
                          height: 32.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.white,
                          ),
                          child: Text(
                            'الجنس',
                            style: GoogleFonts.cairo(
                              fontSize: 14.0,
                              color: const Color(0xFFF2C046),
                              letterSpacing: -0.28,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
// Group: Group 267
                Container(
                  alignment: Alignment(0.02, -1.0),
                  width: 139.0,
                  height: 33.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(8.0),
                    ),
                    color: const Color(0xFFF2C046),
                  ),
                  child: Text(
                    'بيانات الطفل',
                    style: GoogleFonts.cairo(
                      fontSize: 16.0,
                      color: Colors.white,
                      letterSpacing: -0.32,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )*/
        ],
      ),
    );
  }
}
