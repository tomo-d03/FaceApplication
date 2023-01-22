import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Judge_result_page extends StatelessWidget {
  Judge_result_page({super.key});

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
        title: Text("判定結果"),
        
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            child: Image.network("https://www.photo-ac.com/assets/img/ai_model_v2/model_14.png"),
          ),
          //Text("実行時間: ${executionTime}"),
          Text("実行時間: 2023/01/23/05:40"),
          SizedBox(height: 20),
          Divider(),
          SizedBox(height: 20),
          Text("あなたの選択履歴", style: TextStyle(fontWeight: FontWeight.bold)),
          Divider(),

          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: Row(
                        children: [
                          index % 2 == 0 ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                          SizedBox(width: 10),
                          Image.asset("assets/images/avatar${index + 1}.png", width: 30, height: 30),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
                    
          Divider(),

        ],
      ),
    );
  }
}
