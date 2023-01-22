import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Find_page extends StatelessWidget {
  Find_page({super.key});

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
        title: Text("探す"),
        
      ),
    );
  }
}
