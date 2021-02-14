import 'package:captain/helpers/loader.dart';
import 'package:captain/provider/CoachProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:google_fonts/google_fonts.dart';

class CoachComponent extends StatefulWidget {
  @override
  _CoachComponentState createState() => _CoachComponentState();
}

class _CoachComponentState extends State<CoachComponent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CoachProvider>(builder: (context, data, child)
    {
      var d=data.items.isNotEmpty ? data.items.first :null;
      return d == null ? Loader():
      ResponsiveGridRow(
        children:  data.items.map((i){
          return ResponsiveGridCol(
            xs: 6,
            md: 3,
            child:
            Container(
              height:200,
              margin: EdgeInsets.symmetric(horizontal: 8),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(6),
                        child:Container(
                            height: 90,
                            width: MediaQuery.of(context).size.width*50/100,
                            child:Center(
                              child: Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage('${i.img}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                        ),
                      ),
                      Center(
                          child:Text(
                            '${i.name}',
                            style: GoogleFonts.cairo(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          )
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 9),
                            child:
                            Text(
                              'الصنف:',
                              style: GoogleFonts.cairo(
                                fontSize: 13.0,
                                color: const Color(0xFF002087),
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.right,
                            )
                          ),
                          Expanded(child:
                          SizedBox(width: 30,),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 9),
                              child:
                              Text(
                                '${i.cat_name}',
                                style: GoogleFonts.cairo(
                                  fontSize: 13.0,
                                  color: const Color(0xFF717171),
                                  letterSpacing: -0.26,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                          )
                        ],
                      ),
                      Center(
                        child: Container(
                          width: 128.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.0),
                            color: const Color(0xFFF2C046),
                          ),
                          child: Text(
                            '${i.country_code}',
                            style: GoogleFonts.cairo(
                              fontSize: 14.0,
                              color: Colors.black,
                              letterSpacing: -0.28,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  )
              ),
            ),

          );
        }).toList(),
      );
    }
    );
  }
}
