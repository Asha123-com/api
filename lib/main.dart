import 'package:api/pages/people_home.dart';
import 'package:api/wp%20pages/wp%20home.dart';
import 'package:api/wp%20pages/wp%20splash%20screen.dart';
import 'package:api/wp%20views/home%20view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/home', page: ()=> WallHome()),
        GetPage(name: '/people', page: ()=> PeopleHome()),
        GetPage(name: '/splash', page: ()=>SplashScreen()),
        GetPage(name: '/vhome', page: ()=>HomeView()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: WallHome(),
    );
  }
}
