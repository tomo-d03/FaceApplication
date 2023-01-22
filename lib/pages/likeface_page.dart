import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'Judge_Page.dart';


class likeface_page extends StatelessWidget {
  likeface_page({super.key});

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
        title: Text("顔の好みを判定"),
        
      ),

      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Text(
                "本判定は、これから流れてくる人間の画像に「好き」または、「きらい」と直感で判断していただき、あなた好みの顔の特徴量を抽出するものです。準備ができましたら、下の判定開始をタップしてください。"),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => judge_page(),
                ),
              );
            },
            child: Text("判定開始"),
          ),
          SizedBox(height: 20),
          Text("最新の判定履歴", style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: 
            //judgementHistory.length > 0 ?
            ListView(
                  children: <Widget>[
                    Divider(),
                    ListTile(
                      //leading: Image.judgementHistory[0]['imageUrl']network(),
                      leading: Image.network("https://www.photo-ac.com/assets/img/ai_model_v2/model_14.png"),
                      //title: Text(judgementHistory[0]['judgement']),
                      title: Text("判定日時"),
                      subtitle: Text("2023/01/23/05:40"),
                    ),
                    Divider(),
                  ],
                ) 
              //: Center(child: Text("判定履歴なし"))
          )
        ],
      ),
    );
  }
}
