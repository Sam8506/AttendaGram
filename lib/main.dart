import 'package:flutter/material.dart';
import 'package:sgp/ClassDetails.dart';
import 'package:sgp/StudentDashboard.dart';
import 'package:sgp/List.dart';
import 'package:sgp/FacultyLogin.dart';
import 'package:sgp/LoginMain.dart';
import 'package:sgp/splash.dart';
import 'package:sgp/FacultyAccess.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/Spl',
      routes: {
        '/': (context) => login_page(),
        '/Spl': (context) => Splash(),
        '/show': (context) => getuserName(),
        '/takea': (context) => TakeA(),
        '/an': (context) => newSub(),
        '/lst':(context) => lstP(),
        '/faculty':(context) => faculty_login(),
      }));
}
