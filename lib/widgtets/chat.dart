

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpt_clone/data/wraps.dart';
import 'package:gpt_clone/pages/chatPage.dart';
import 'package:gpt_clone/widgtets/wrapcontainer.dart';

class ChatBoard extends StatefulWidget {
  const ChatBoard({super.key});

  @override
  State<ChatBoard> createState() => _ChatBoardState();
}

class _ChatBoardState extends State<ChatBoard> {
  String currentText = " ";
  final querycontroller = TextEditingController();

  @override
  void dispose() {
    querycontroller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void sendText(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Chatpage(initialText: querycontroller.text.trim(),)));
  }
  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20
      ),
      width: screensize.width * 0.6,
      child: Column(
        children: [
          Text("What can I help with?",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xfff4f4f4),
              borderRadius: BorderRadius.circular(18)
            ),
            child: Column(
              children: [
                CallbackShortcuts(
                  bindings: <ShortcutActivator, VoidCallback>{
                    const SingleActivator(LogicalKeyboardKey.enter) : (){
                      sendText();
                    }
                  },
                  child: TextField(
                    controller: querycontroller,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: "Message",
                      border: InputBorder.none,
                      
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Icon(Icons.attach_file, color: Colors.grey),
                  GestureDetector(
                    onTap: sendText,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.send, color: Colors.white),
                    ),
                  )
                ],)
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Wrap(

            spacing: 8.0,
            runSpacing: 4.0,
            children:listed.map((item) => Wrapcontainer(item: item)).toList(),
          ),
        ],
      ),
    );
  }
}