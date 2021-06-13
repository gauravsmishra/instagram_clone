import 'package:flutter/material.dart';
import 'package:instagram_clone/user%20data/activity_model.dart';

class UserListtile extends StatelessWidget {
  final Activitymodel data;

  const UserListtile({@required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          radius: 30, child: ClipOval(child: Image.asset("assets/4.jpg"))),
      title: Text(
        "Since you follow #1 military ",
        maxLines: 1,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
      subtitle: Row(
        children: [
          Icon(
            Icons.favorite,
            color: Colors.red,
            size: 15,
          ),
          SizedBox(
            width: 4,
          ),
          Text("page,you might like"),
          // Icon(Icons.)
        ],
      ),
      trailing: Container(
        height: 30,
        width: 60,
        decoration: BoxDecoration(
            color: Colors.blue[500], borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: Text(
          "Follow",
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
