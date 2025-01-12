import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Chatpage extends StatefulWidget {
  final String initialText;
  const Chatpage({super.key, required this.initialText});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  List<Widget> views = [];
  final Controller = TextEditingController();
  final socket = WebSocketChannel.connect(Uri.parse("ws://localhost:8000/ws"));
  late StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    setState(() {
      views.add(userText(widget.initialText));
    });
    socket.sink.add(widget.initialText);
    subscription = socket.stream.listen((data) {
      setState(() {
        views.add(llmResponse(data, context));
        views.add(SizedBox(height: 50,));
      });
    }, onError: (error) {
      setState(() {
        views.add(Text('Error: $error'));
      });
    });
  }

  @override
  void dispose() {
    Controller.dispose();
    subscription.cancel();
    socket.sink.close();
    super.dispose();
  }

  void sendMessage () {
      setState(() {
           views.add(userText(Controller.text.trim()));
          });
                      // print("The length of views is ${views.length}");
    socket.sink.add(Controller.text.trim());
    Controller.clear();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: views),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey,
            ),
            child: CallbackShortcuts(
              bindings: <ShortcutActivator, VoidCallback>{
                const SingleActivator(LogicalKeyboardKey.enter): (){
                  sendMessage();
                }
              },
              child: TextField(
                autofocus: true,
                
                controller: Controller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  border: InputBorder.none,
                  suffixIcon: GestureDetector(
                    onTap: sendMessage,
                    child: Icon(Icons.send),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget userText(String theText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(right: 300, top: 20),
          padding: EdgeInsets.all(13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blueGrey,
          ),
          child: Text(theText),
        ),
      ],
    );
  }

  Widget llmResponse(String theText, BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: screenSize.width * 0.7,
          margin: EdgeInsets.only(left: 30, top: 20, right: 50),
          padding: EdgeInsets.all(13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            
          ),
          child: Text(theText, softWrap: true,textAlign: TextAlign.left,),
        ),
      ],
    );
  }
}
