import 'package:captain/component/AcademyComponent.dart';
import 'package:captain/component/CoachComponent.dart';
import 'package:captain/component/PlaygroundComponent.dart';
import 'package:captain/component/common/Drawerco.dart';
import 'package:captain/controller/AcademyController.dart';
import 'package:captain/controller/CoachController.dart';
import 'package:captain/controller/PlaygroundController.dart';
import 'package:captain/helpers/database.dart';
import 'package:captain/helpers/loader.dart';
import 'package:captain/provider/AcademyProvider.dart';
import 'package:captain/provider/CoachProvider.dart';
import 'package:captain/provider/PlaygroundProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data;

  var path=DataBase.urlstatename();

  void initState() {
    super.initState();
    this.getJsonData();
    Provider.of<PlaygroundProvider>(context, listen: false).removeAll();
    Provider.of<PlaygroundProvider>(context, listen: false).set_count('2');
    Provider.of<AcademyProvider>(context, listen: false).removeAll();
    Provider.of<AcademyProvider>(context, listen: false).set_count('2');
    Provider.of<CoachProvider>(context, listen: false).removeAll();
    Provider.of<CoachProvider>(context, listen: false).set_count('2');
    PlaygroundController.getdatafeature(context);
    AcademyController.getdatafeature(context);
    CoachController.getdatafeature(context);
  }

  Future<String> getJsonData() async {
    var url=DataBase.urlstatename()+'api/slide';
    final response = await http.get(url);

    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      //    print(convertDataToJson);
      data = convertDataToJson['items'];
    });
    return "Success";
  }

  Widget Image_Carousel () {
    return new Container(
      height: 180,
      child: data == null ? Loader() : new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Stack(
              children: <Widget>[
                Center(
                  child: Container(
                      height: 175,
                      decoration: BoxDecoration(
                        color: const Color(0xfff2f2f2).withOpacity(0.5),

                        borderRadius: BorderRadius.circular(10),

                      ),
                      child:
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          "${path}/upload/img/thum/${data[index]['img']}",
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 94 / 100,
                          fit: BoxFit.fill,
                        ),

                      )

                  ),
                ),

              ]
          );
        },

        itemCount: data == null ? 0 : data.length,
        itemWidth: MediaQuery
            .of(context)
            .size
            .width * 93 / 100,
      ),
    );


  }

  @override

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: Container(
        width: MediaQuery.of(context).size.width,
        child: Drawerc(),
      ),
      appBar: GradientAppBar(
        title: Text(
          'الرئيسية',
          style: GoogleFonts.cairo(
            fontSize: 18.0,
            color: Colors.white,
            letterSpacing: -0.36,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        gradient: LinearGradient(colors: [const Color(0xFFF2C046),const Color(0xFFE4AF3D),const Color(0xFFC78B2B)],begin: Alignment.bottomRight,
          end: Alignment.topLeft,),
        centerTitle: true,
        leading:  InkWell(
          onTap: () => _drawerKey.currentState.openDrawer(),
          child:Row(
            children: [
              SizedBox(width: 10,),
              Container(
                  height:38,
                  width:38,
                  decoration: BoxDecoration(
                      color:  Colors.white,
                      shape: BoxShape.circle
                  ),
                  child:Center(
                    child: Icon(Icons.menu,color: Color(0xFFE4AF3D),size: 20,),
                  )
              ),
            ],
          )

        ),
        actions: [
          InkWell(
            onTap: (){},
            child:  Container(
                height:38,
                width:38,
                decoration: BoxDecoration(
                    color:  Colors.white,
                    shape: BoxShape.circle
                ),
                child:Center(
                    child: Icon(Icons.notifications,color: Color(0xFFE4AF3D),size: 20,)
                )
            ),
          ),
          SizedBox(width: 10,),

        ],
      ),

      body: ListView(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 3 / 100),
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 14),
          child:  Image_Carousel(),
          ),

          SizedBox(height: 10,),
          Row(
            children: [
              Container(
                width: 118.0,
                height: 28.0,
                margin: EdgeInsets.only(right: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1.0,
                    color: const Color(0xFF002087),
                  ),
                ),
                child: Text(
                  'الملاعب المميزة',
                  style: GoogleFonts.cairo(
                    fontSize: 14.0,
                    color: const Color(0xFF002087),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(child:
              SizedBox(width: 30,),

              ),
              InkWell(
                onTap: () {},
                child:
                SizedBox(
                  width: 65.0,
                  height: 26.0,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: 65.0,
                        height: 25.0,
                        margin: EdgeInsets.only(left: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: const Color(0xFF002087),
                        ),
                        child:  Text(
                          'الكل',
                          style: GoogleFonts.cairo(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),

          PlaygroundComponent(),
          SizedBox(height: 10,),

          Row(
            children: [
              Container(
                width: 118.0,
                height: 28.0,
                margin: EdgeInsets.only(right: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1.0,
                    color: const Color(0xFF002087),
                  ),
                ),
                child: Text(
                  'الأكاديميات المتاحة',
                  style: GoogleFonts.cairo(
                    fontSize: 14.0,
                    color: const Color(0xFF002087),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(child:
              SizedBox(width: 30,),

              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/academy');
                },
                child:
                SizedBox(
                  width: 65.0,
                  height: 26.0,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: 65.0,
                        height: 25.0,
                        margin: EdgeInsets.only(left: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: const Color(0xFF002087),
                        ),
                        child:  Text(
                          'الكل',
                          style: GoogleFonts.cairo(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),

          AcademyComponent(),
          SizedBox(height: 10,),

          Row(
            children: [
              Container(
                width: 118.0,
                height: 28.0,
                margin: EdgeInsets.only(right: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1.0,
                    color: const Color(0xFF002087),
                  ),
                ),
                child: Text(
                  'ملفات المحترفين',
                  style: GoogleFonts.cairo(
                    fontSize: 14.0,
                    color: const Color(0xFF002087),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(child:
              SizedBox(width: 30,),

              ),
              InkWell(
                onTap: () {},
                child:
                SizedBox(
                  width: 65.0,
                  height: 26.0,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: 65.0,
                        height: 25.0,
                        margin: EdgeInsets.only(left: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: const Color(0xFF002087),
                        ),
                        child:  Text(
                          'الكل',
                          style: GoogleFonts.cairo(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
          CoachComponent(),

        ],
      ),

    );
  }
}
