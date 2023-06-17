import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:women_safety_final_project/child/bottom_page.dart';
import 'package:women_safety_final_project/child/bottom_screens/child_home_page.dart';
import 'package:women_safety_final_project/child/child_login_screen.dart';
import 'package:women_safety_final_project/db/shared_pref.dart';
import 'package:women_safety_final_project/parent/parent_home_screen.dart';
import 'package:workmanager/workmanager.dart';

import 'background_services.dart';
import 'utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterBackgroundService.initialize(onStart);
  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: false,
  );

  await Firebase.initializeApp();
  await MySharedPreference.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.firaSansTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: MySharedPreference.getUserType(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == "") {
            return LoginScreen();
          }
          if (snapshot.data == "child") {
            return BottomPage();
          }
          if (snapshot.data == "parent") {
            return ParentHomeScreen();
          }

          return progressIndicator(context);
        },
      ),
    );
  }

  // Future<bool> isAppOpeningForFirstTime() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool result = prefs.getBool("appOpenedBefore") ?? false;
  //   if (!result) {
  //     prefs.setBool("appOpenedBefore", true);
  //   }
  //   return result;
  // }
}

//  
