import 'package:captain/helpers/loader.dart';
import 'package:captain/provider/PlaygroundProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaygroundComponent extends StatefulWidget {
  @override
  _PlaygroundComponentState createState() => _PlaygroundComponentState();
}

class _PlaygroundComponentState extends State<PlaygroundComponent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlaygroundProvider>(builder: (context, data, child)
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
                          height: 127,
                          width: MediaQuery.of(context).size.width*50/100,
                          child:Image.network('${i.images[0]['img']}',fit: BoxFit.cover,)
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 9),
                        child:Text(
                          '${i.name}',
                          style: GoogleFonts.cairo(
                            fontSize: 14.0,
                            color: const Color(0xFF002087),
                          ),
                        )
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 9),
                          child:
                        Text(
                          ' ${i.price} د.ك',
                          style: GoogleFonts.cairo(
                            fontSize: 12.0,
                            color: const Color(0xFF717171),
                          ),
                          textAlign: TextAlign.right,
                        ),
                        ),
                        Expanded(child:
                        SizedBox(width: 30,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 9),
                          child:
                        Text(
                          '${i.city}',
                          style: GoogleFonts.cairo(
                            fontSize: 12.0,
                            color: const Color(0xFF002087),
                          ),
                        )
                        )
                      ],
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
