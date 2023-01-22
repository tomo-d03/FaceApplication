import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'ChatRoomPage.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

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
        title: Text("チャットリスト"),
        
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("https://www.photo-ac.com/assets/img/ai_model_v2/model_6.png"),
                  ),
                  title: Text("John Doe"),
                  subtitle: Text("How's it going?"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatRoomPage(),
                      ),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("https://www.photo-ac.com/assets/img/ai_model_v2/model_18.png"),
                  ),
                  title: Text("Jane Smith"),
                  subtitle: Text("Wanna grab lunch later?"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatRoomPage(),
                      ),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("http://six-cube.com/wp-content/uploads/2019/06/model_47.png"),
                  ),
                  title: Text("Bob Johnson"),
                  subtitle: Text("Want to play video games?"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatRoomPage(),
                      ),
                    );
                  },
                ),
                Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

