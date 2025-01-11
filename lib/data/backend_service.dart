

// import 'dart:async';

// import 'package:web_socket_client/web_socket_client.dart';

// class socket_service{
//   socket_service._internal();
//   static final socket_service instance = socket_service._internal();

//   factory socket_service() => instance;

//   WebSocket? socket;

//   final _contentstreamcontroller = StreamController.broadcast();
//   Stream get contentcontroller => _contentstreamcontroller.stream;

//   connect(){
//     socket = WebSocket(Uri.parse("ws://127.0.0.1:8000/ws"));
//     socket!.messages.listen((message){
//       _contentstreamcontroller.add(message);
//     });

//   }

//   void requestInfo(String query){
//     socket!.send(query);
//   }

  

// }