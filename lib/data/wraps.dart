import 'package:flutter/material.dart';

class items {
  final IconData icon;
  final String text;
  final Color iconcolor;

  items({required this.icon, required this.text, required this.iconcolor});
}

List <items> listed = [
  items(icon: Icons.image, text: "Create image", iconcolor: Colors.green),
  items(icon: Icons.lightbulb, text: "Make a plan", iconcolor: Color(0xFFD78A76)),
  items(icon: Icons.insert_drive_file, text: "Summarize text", iconcolor: Color(0xFFC2906F))
];