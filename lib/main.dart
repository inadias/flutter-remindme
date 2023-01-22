import 'package:flutter/material.dart';
import 'animation_delay.dart';
import 'package:remind_me/welcome_page.dart';
const color_red = const Color(0xFFE9717D);
const color_green = const Color(0xFF427577);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home:WelcomePage());

  }
}
