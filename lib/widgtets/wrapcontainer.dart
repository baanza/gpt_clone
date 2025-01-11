

import 'package:flutter/material.dart';
import 'package:gpt_clone/data/wraps.dart';

class Wrapcontainer extends StatelessWidget {
  final items item;
  const Wrapcontainer({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 13),
      padding: EdgeInsets.all(8),

      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        children: [
          Icon(item.icon, color: item.iconcolor,),
          const SizedBox(width: 10,),
          Text(item.text),
        ],
      ),
    );
  }
}