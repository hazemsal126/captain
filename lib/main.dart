import 'package:captain/helpers/AppLanguage.dart';
import 'package:captain/pages/Splash.dart';
import 'package:captain/pages/academy.dart';
import 'package:captain/pages/academybycategory.dart';
import 'package:captain/pages/academydetail.dart';
import 'package:captain/pages/home.dart';
import 'package:captain/pages/login.dart';
import 'package:captain/pages/profile.dart';
import 'package:captain/pages/register.dart';
import 'package:captain/provider/AcademyCatProvider.dart';
import 'package:captain/provider/AcademyProvider.dart';
import 'package:captain/provider/CoachProvider.dart';
import 'package:captain/provider/PlaygroundProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:captain/helpers/AppLocalizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<AppLanguage> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  appLanguage.fetchLocale();
  runApp(MyApp(
    appLanguage: appLanguage,
  ));
}

class MyApp extends StatelessWidget {
  final AppLanguage appLanguage;
  MyApp({this.appLanguage});
  @override

  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AppLanguage>.value(
            value: appLanguage,
          ),
          ChangeNotifierProvider(create: (_) => PlaygroundProvider()),
          ChangeNotifierProvider(create: (_) => AcademyProvider()),
          ChangeNotifierProvider(create: (_) => CoachProvider()),
          ChangeNotifierProvider(create: (_) => AcademyCatProvider()),
        ],
        child: Consumer<AppLanguage>(builder: (context, model, child) {
          return MaterialApp(
            locale: Provider.of<AppLanguage>(context).appLocal,
            supportedLocales: [
              Locale('ar', ''),
              Locale('en', 'US'),
            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            debugShowMaterialGrid: false,
            debugShowCheckedModeBanner: false,
            title: 'Captain',
            theme: ThemeData(
              fontFamily: 'Cairo',
              primarySwatch: Colors.orange,
              scaffoldBackgroundColor: Colors.white,
                canvasColor: Colors.transparent
            ),
            home: Splash(),
            routes: {
              '/home':(context)=>Home(),
              '/register':(context)=>Register(),
              '/login':(context)=>Login(),
              '/profile':(context)=>Profile(),
              '/academy':(context)=>Academy(),
              '/academybycategory':(context)=>AcademyByCategory(),
              '/academydetail':(context)=>AcademyDetail(),

            },

          );
        }
        )
    );
  }
}