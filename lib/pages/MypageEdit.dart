import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'auth_page.dart';

class MyPageEdit extends StatelessWidget {
  MyPageEdit({super.key});

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
        title: Text("EDIT PROFILE"),
      ),

      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://tobutoptours.jp/column/all/img/zekkei001/title.jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage("https://styly.cc/wp-content/uploads/2019/12/20191225-042212880654_9475.png"),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("User Name"),
              ),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text("Age"),
              ),
              ListTile(
                leading: Icon(Icons.work),
                title: Text("Job"),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text("Location"),
              ),
              ListTile(
                leading: Icon(Icons.description),
                title: Text("Bio"),
              ),
            ],
          ),
        ),

    );
  }
}

