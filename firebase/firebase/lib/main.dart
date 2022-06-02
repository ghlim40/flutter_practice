// 참조 : https://www.google.com/search?q=%EC%95%88%EB%93%9C%EB%A1%9C%EC%9D%B4%EB%93%9C+%EC%8A%A4%ED%8A%9C%EB%94%94%EC%98%A4+%EC%A3%BC%EC%84%9D&oq=%EC%95%88%EB%93%9C%EB%A1%9C%EC%9D%B4%EB%93%9C+%EC%8A%A4%ED%8A%9C%EB%94%94%EC%98%A4+%EC%A3%BC%EC%84%9D&aqs=chrome..69i57j0i512l4j0i30l3j0i8i30l2.5100j0j7&sourceid=chrome&ie=UTF-8

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
// import 'dart:developer';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'data_model.dart';
//
// void main() => runApp(
//   new MaterialApp(title: 'Firebase Practice',home: new WidgetDemo()),
// );
// class WidgetDemo extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => WidgetDemoState();
// }
// class WidgetDemoState extends State<WidgetDemo> {
//   bool isLoading = false;
//   Map<String, datamodel> responseData = Map();
//
//   final List<String> videoIdList = <String>[];

//   Future<void> init(String collection) async {
//     await Firebase.initializeApp();
//     FirebaseFirestore.instance
//         .collection(collection)
//         .snapshots()
//         .listen((event) {
//       event.docs.forEach((element) {
//         log("code : ${element.data()['code']}");
//         log("content : ${element.data()['content']}");
//         log("image : ${element.data()['image']}");
//         log("view : ${element.data()['view']}");
//
//         if (collection == 'my_youtube') {
//           videoIdList.add(element.data()['code']);
//           responseData[element.data()['code']] = datamodel(
//               title: element.data()['title'],
//               value: element.data()['value'],);
//         }
//       });
//       setState(() {
//         isLoading = true;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: const Text('Retrofit Demo'),
//       ),
//       body: getPage(),
//     );
//   }
//
//   Widget getPage() {
//     late Widget page;
//     if (!isLoading) {
//       page = page0();
//       init('my_youtube');
//     } else {
//       page = page1();
//     }
//     return page;
//   }
//
//   Container page0() {
//     return Container(
//       alignment: Alignment.center,
//       child: Text(
//         'Loading...',
//         style: TextStyle(color: Colors.blue, fontSize: 30),
//       ),
//     );
//   }
//
//   ListView page1() {
//     return ListView(
//       children: <Widget>[
//         ListTile(
//           leading: Image.network(
//               (responseData[videoIdList[0]] as DataModel).thumbnail),
//           title: Text((responseData[videoIdList[0]] as DataModel).title),
//           subtitle: Text(
//               'View : ${(responseData[videoIdList[0]] as DataModel).viewCount}'),
//           trailing: Icon(Icons.favorite_border),
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Player(videoIdList[0],
//                     (responseData[videoIdList[0]] as DataModel).title),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
//
// class Player extends StatefulWidget {
//   final String _videoID;
//   final String _videoTitle;
//
//   Player(this._videoID, this._videoTitle);
//
//   @override
//   PlayerState createState() => PlayerState(_videoID, _videoTitle);
// }
// class PlayerState extends State<Player> {
//   String _videoID;
//   String _videoTitle;
//
//   PlayerState(this._videoID, this._videoTitle);
//
//   late YoutubePlayerController _controller;
//
//   @override
//   void initState() {
//     _controller = YoutubePlayerController(
//       initialVideoId: _videoID,
//       flags: const YoutubePlayerFlags(
//         mute: false,
//         autoPlay: true,
//         disableDragSeek: false,
//         loop: false,
//         isLive: false,
//         forceHD: false,
//         enableCaption: true,
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           '$_videoTitle',
//           style: TextStyle(fontSize: 20.0),
//         ),
//       ),
//       body: YoutubePlayer(
//         key: ObjectKey(_controller),
//         controller: _controller,
//         actionsPadding: const EdgeInsets.only(left: 16.0),
//         bottomActions: [
//           CurrentPosition(),
//           const SizedBox(width: 10.0),
//           ProgressBar(isExpanded: true),
//           const SizedBox(width: 10.0),
//           RemainingDuration(),
//           //FullScreenButton(),
//         ],
//       ),
//     );
//   }
// }
