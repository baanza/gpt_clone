import 'package:flutter/material.dart';
import 'package:gpt_clone/widgtets/appbar.dart';
import 'package:gpt_clone/widgtets/chat.dart';

void main() {
  print("hello world");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(
      scaffoldBackgroundColor: Color(0xFFFFFFFF),
    ),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TheeBar(),
          ChatBoard(),
          Text("by messaging .., you agree to my not our terms and condition")
        ],
      ),
    );
  }
}
