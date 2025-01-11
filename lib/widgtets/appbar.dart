

import 'package:flutter/material.dart';

class TheeBar extends StatelessWidget {
  const TheeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        right: 10
      ),
      child: Row(
        children: [
          Icon(Icons.add, color: Colors.grey),
          const SizedBox(width: 15,),
          const Text("Chat Gpt 4o Mini", style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,

          ),),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text("Log in", style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500
            )),
          ),
          const SizedBox(
            width: 18,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text("Sign up", style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500
            )),
          )

        ],
      ),
    );
  }
}