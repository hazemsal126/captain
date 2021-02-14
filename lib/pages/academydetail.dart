import 'package:captain/component/common/AppBar.dart';
import 'package:captain/controller/AcademyController.dart';
import 'package:captain/helpers/database.dart';
import 'package:captain/helpers/loader.dart';
import 'package:captain/pages/orderdata.dart';
import 'package:captain/provider/AcademyProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AcademyDetail extends StatefulWidget {
  String academy_id;
  AcademyDetail({this.academy_id});
  @override
  _AcademyDetailState createState() => _AcademyDetailState();
}

class _AcademyDetailState extends State<AcademyDetail> {
  int _count=1;
  DataBase dataBase = new DataBase();
  String msgStatus = '';
  int s=1;
  @override

  _onPressed(){
    setState(() {
      s=0;
    });
    setState(() {
      dataBase.add_order(widget.academy_id,'${_count}').whenComplete((){
        if(dataBase.status ){
          setState(() {
            s=1;
          });
          dataBase.toast_success('تمت العملية بنجاح');
        }else{
          setState(() {
            s=1;
          });
          msgStatus = dataBase.msg;
          dataBase.toast_error(msgStatus);
        }
      });

    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child:  app_bar(title: 'تفاصيل الأكاديمية',),
            preferredSize: Size.fromHeight(55)),
        bottomNavigationBar: Container(
          height: 121.0,
          color: const Color(0xFF002087),
          child: s==0 ? Loader():

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 252,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'اختر عدد الأطفال',
                      style: GoogleFonts.cairo(
                        fontSize: 17.0,
                        color: Colors.white,
                        letterSpacing: -0.34,
                        fontWeight: FontWeight.w700,
                        height: 1.35,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    InkWell(
                      onTap: (){
                        if(_count !=1){
                          setState(() {
                            _count-=1;
                          });
                        }
                      },
                      child:  Container(
                          alignment: Alignment.center,
                          width: 26.0,
                          height: 26.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(Icons.remove,color: const Color(0xFF002087),size: 18,)
                      ),
                    ),

                    Text(
                      '${_count}',
                      style: GoogleFonts.cairo(
                        fontSize: 20.0,
                        color: Colors.white,
                        letterSpacing: -0.4,
                        fontWeight: FontWeight.w700,
                        height: 1.15,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          _count+=1;
                        });
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width: 26.0,
                          height: 26.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(Icons.add,color: const Color(0xFF002087),size: 18,)
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 12,),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OrderData()));
                },
                child:
                Container(
                  width: 138.0,
                  height: 35.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0xFFF2C046),
                  ),
                  child: Center(
                    child: Text(
                      'حجز الخدمة',
                      style: GoogleFonts.cairo(
                        fontSize: 14.0,
                        color: const Color(0xFF002087),
                        letterSpacing: -0.28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ),
              )


            ],
          ),
        ),

        body: Consumer<AcademyProvider>(builder: (context, data, child)
        {
          var d=data.items.isNotEmpty ? data.items.first :null;
          return d == null ? Loader():
          ListView(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 3 / 100),
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 14),
                child: Container(
                  height: 180,
                  child: d.images == null ? Loader() : new Swiper(
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
                                      "${d.images[index]['img']}",
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

                    itemCount: d.images == null ? 0 : d.images.length,
                    itemWidth: MediaQuery
                        .of(context)
                        .size
                        .width * 93 / 100,
                  ),
                ),
              ),

              SizedBox(height: 10,),
              Row(
                children: [
                  SizedBox(width: 10,),
                  Text(
                    '${d.name}',
                    style: GoogleFonts.cairo(
                      fontSize: 20.0,
                      color: const Color(0xFF002087),
                      letterSpacing: -0.4,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(child: SizedBox()),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child:Container(
                      width: 59.0,
                      height: 33.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.0),
                        color: const Color(0xFFF2C046),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '4.5',
                            style: GoogleFonts.cairo(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 3,),
                          Icon(Icons.star,color: Colors.black,size: 12,)
                        ],
                      ),
                    ),

                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 10,),
                  Text(
                    'رسوم الإشتراك',
                    style: GoogleFonts.cairo(
                      fontSize: 16.0,
                      color: Colors.black,
                      letterSpacing: -0.32,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 15,),
                  Text(
                    '${d.price}\$',
                    style: GoogleFonts.cairo(
                      fontSize: 24.0,
                      color: const Color(0xFF717171),
                      letterSpacing: -0.48,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),

                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 15,),
                  d.gender !='ذكر' ?
                  Container(
                    alignment: Alignment(-0.04, -1.0),
                    width: 101.0,
                    height: 33.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      color: const Color(0xFFDBE4FF),
                      border: Border.all(
                        width: 1.0,
                        color: const Color(0xFF002087),
                      ),
                    ),
                    child:
                    SizedBox(
                      width: 47.11,
                      height: 30.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Align(
                              alignment: Alignment(0.0, 0.2),
                              child: Image.asset('images/woman.png')
                          ),
                          Text(
                            'إناث',
                            style: GoogleFonts.cairo(
                              fontSize: 16.0,
                              color: const Color(0xFF002087),
                              letterSpacing: -0.32,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),

                        ],
                      ),
                    ),
                  ):SizedBox(),
                  SizedBox(width: 15,),
                  d.gender !='أنثى' ?
                  Container(
                    alignment: Alignment(-0.04, -1.0),
                    width: 101.0,
                    height: 33.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      color: const Color(0xFFDBE4FF),
                      border: Border.all(
                        width: 1.0,
                        color: const Color(0xFF002087),
                      ),
                    ),
                    child:
// Group: Group 258

                    SizedBox(
                      width: 53.21,
                      height: 30.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Align(
                              alignment: Alignment(0.0, 0.2),
                              child: Image.asset('images/man.png')
                          ),
                          Text(
                            'ذكور',
                            style: GoogleFonts.cairo(
                              fontSize: 16.0,
                              color: const Color(0xFF002087),
                              letterSpacing: -0.32,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),

                        ],
                      ),
                    ),
                  ):SizedBox(),
                ],
              ),
              SizedBox(height: 12,),
              Row(
                children: [
                  SizedBox(width: 12,),
                  Icon(Icons.location_on,color: Colors.black,size: 18,),
                  SizedBox(width: 10,),
                  Text(
                    'محافظة ${d.city_name}، ${d.address}',
                    style: GoogleFonts.cairo(
                      fontSize: 18.0,
                      color: Colors.black,
                      letterSpacing: -0.32,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              SizedBox(height: 12,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 12),
                child:  Container(
                  height: 69.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDBE4FF),
                    border: Border.all(
                      width: 0.7,
                      color: const Color(0xFF002087),
                    ),
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          width: 139.0,
                          height: 28.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(8.0),
                            ),
                            color: const Color(0xFF002087),
                          ),
                          child: Text(
                            ' أوقات العمل',
                            style: GoogleFonts.cairo(
                              fontSize: 14.0,
                              color: Colors.white,
                              letterSpacing: -0.28,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 7,),
                      Center(
                        child: Text(
                          '${d.time_work}',
                          style: GoogleFonts.cairo(
                            fontSize: 13.0,
                            color: const Color(0xFF002087),
                            letterSpacing: -0.26,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Padding(padding: EdgeInsets.only(right: 12),
                  child: Text(
                    'نبذة عن الأكاديمية',
                    style: GoogleFonts.cairo(
                      fontSize: 16.0,
                      color: Colors.black,
                      letterSpacing: -0.32,
                      fontWeight: FontWeight.w700,
                    ),
                  )
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 16),
                child:  Container(
                  child:  Html(
                    customTextAlign: (_) => TextAlign.right,
                    defaultTextStyle: GoogleFonts.cairo(
                      fontSize: 13.0,
                      color: const Color(0xFF002087),
                      letterSpacing: -0.26,
                      fontWeight: FontWeight.w700,
                    ),
                    data: '${d.content}',
                  ),
                ),
              ),

            ],
          );
        })
    );
  }
}
