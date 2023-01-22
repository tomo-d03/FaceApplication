import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Mypage.dart';
import 'chat_page.dart';
import 'auth_page.dart';
import 'likeface_page.dart';
import 'Find_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

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
          icon: Icon(Icons.account_circle),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyPage()));
          },
        ),
        title: Text("HOME"),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AuthPage(),
                  ),
                );
              });
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.face),
              title: Text('顔の好みを測定'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => likeface_page()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('探す'),
              onTap: () {
                // navigate to search page
                Navigator.push(context, MaterialPageRoute(builder: (context) => Find_page()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text('チャット'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
              },
            ),
            Divider(),
          ],
        ),
      ),

    );
  }
}