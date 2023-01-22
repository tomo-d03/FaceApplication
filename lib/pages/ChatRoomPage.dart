import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatRoomPage extends StatelessWidget {
  ChatRoomPage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("user1"),
        
      ),
      
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 1.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          Text('チャットのテキストがここに表示されます'),
                        ],
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'メッセージを入力してください',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
