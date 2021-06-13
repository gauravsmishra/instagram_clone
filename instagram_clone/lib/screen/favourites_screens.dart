import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/user%20data/acticity_list.dart';
import 'package:instagram_clone/user%20data/activity_model.dart';

import '../widgets/user_listtile.dart';

class FavoritveScreen extends StatelessWidget {
  Widget thisweek(
    Activitymodel data,
    BuildContext context,
  ) {
    return ListTile(
      leading: CircleAvatar(
          radius: 30,
          child: ClipOval(child: Image.asset("assets/${data.image}"))),
      title: Text(
        "${data.message} ",
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
      subtitle: Row(
        children: [
          Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          Text("${data.name}"),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Activity",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  child: ClipOval(child: SvgPicture.asset("assets/logo.svg"))),
              title: Text(
                "Follow Requests",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              subtitle: Text("Approve or ignore requests"),
            ),
            //   Padding(
            //     padding: const EdgeInsets.symmetric(vertical: 8),
            //     child: Container(
            //       margin: EdgeInsets.only(left: 15),
            //       width: MediaQuery.of(context).size.width,
            //       child: Text(
            //         "Today",
            //         style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            //       ),
            //     ),
            //   ),
            //  UserListtile(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                margin: EdgeInsets.only(left: 15),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "This Week",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: dummyactivitymodel.length,
                  itemBuilder: (context, index) {
                    return UserListtile(data: dummyactivitymodel[index]);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
