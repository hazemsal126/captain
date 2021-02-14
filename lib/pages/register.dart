import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
              height: 190,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [const Color(0xFFC78B2B),const Color(0xFFE4AF3D),const Color(0xFFF2C046)],begin: Alignment.bottomRight,
                  end: Alignment.topLeft,),
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
                          child:
                          Container(
                              alignment: Alignment.center,
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child:Icon(Icons.arrow_forward,size: 17,color: Color(0xFFE4AF3D),)
                          )
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(.9,.6),
                    child: Container(
                      width: MediaQuery.of(context).size.width*60/100,
                      height: 149,
                      child:  Image.asset('images/lite.png',fit: BoxFit.cover,),
                    ) ,
                  ),
                  Align(
                    alignment: Alignment(.5,.4),
                    child:Text(
                      'إنشاء حساب مستخدم',
                      style: GoogleFonts.cairo(
                        fontSize: 24.0,
                        color: Colors.white,
                        letterSpacing: -0.48,
                        fontWeight: FontWeight.w700,
                        height: 1.75,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              )

          ),
          SizedBox(height: 60,),

          Stack(

            children: [
              Align(
                alignment: Alignment.topLeft,
                child:Column(
                  children: [
                    Container(
                      width: 6.0,
                      height: 61.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        color: const Color(0xFFF2C046),
                      ),
                    ),
                    SizedBox(height: 300,),
                    Container(
                      width: 6.0,
                      height: 110.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        color: const Color(0xFFF2C046),
                      ),
                    ),
                  ],
                ),


              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.only(top: 125),
                  width: 6.0,
                  height: 92.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                    color: const Color(0xFFF2C046),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.center,
                child:Column(
                  children: [

                    Container(
                      height:300,
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
                              Divider(color: Colors.grey,),
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
                              Divider(color: Colors.grey,),
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
                              Divider(color: Colors.grey,),
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
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 40,),
                    InkWell(
                      onTap: () {},
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
                              'تسجيل الحساب',
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
