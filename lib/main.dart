import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynote_app/pages/allPages.dart';
import 'package:mynote_app/pages/home_page.dart';
import 'package:mynote_app/splash/splash.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'mynote_app',
      options: FirebaseOptions(
          apiKey: 'apiKey',
          appId: 'appId',
          messagingSenderId: 'messagingSenderId',
          projectId: 'projectId')
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
      routes: {
        allPages.id:(context) => allPages(),
        HomePage.id:(context) => HomePage(),
      },
    );
  }
}