import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/Judge_result_page.dart';


class judge_page extends StatelessWidget {
  judge_page({super.key});

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
        title: Text("判定中"),
      actions: [
IconButton(
  icon: Icon(Icons.exit_to_app),
  onPressed: () async {
    final action = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("本当に終了しますか？"),
          content: Text("判定が終わっていない場合、正しい判定結果が得られない場合があります"),
          actions: <Widget>[
            TextButton(
              child: Text("はい"),
              onPressed: () {
                Navigator.pop(context, 'yes');
              },
            ),
            TextButton(
              child: Text("いいえ"),
              onPressed: () {
                Navigator.pop(context, 'no');
              },
            ),
          ],
        );
      },
    );
    if (action == 'yes') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Judge_result_page(),
        ),
      );
    }
  },
),
        ],
      ),

    );
  }
}
