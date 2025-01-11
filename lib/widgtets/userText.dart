

import 'package:flutter/material.dart';

class userText extends StatelessWidget {
  final String inputText;
  const userText({super.key, required this.inputText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("You", style: TextStyle(fontWeight: FontWeight.bold),),
        const SizedBox(height: 10,),
        Text(inputText),
      ],
    );
  }
}