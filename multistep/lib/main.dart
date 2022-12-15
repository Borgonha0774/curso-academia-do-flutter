import 'package:flutter/material.dart';
import 'package:multistep/home_page.dart';
import 'package:multistep/register/register_page.dart';

import 'package:multistep/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: const HomePage(),
        //initialRoute: '/',
        routes: {
          const SplashPage().namedRoute: (_) => const SplashPage(),
          const HomePage().namedRoute: (_) => const HomePage(),
          const RegisterPage().namedRoute: (_) => const RegisterPage(),
        });
  }
}
