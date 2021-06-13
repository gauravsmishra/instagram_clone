import 'package:flutter/material.dart';
import 'package:instagram_clone/screen/main_screen.dart';

class Myposts extends StatefulWidget {
  final int index;
  Myposts(this.index);
  @override
  _MypostsState createState() => _MypostsState();
}

class _MypostsState extends State<Myposts> {
  // MainScreen mystories = MainScreen();
  ScrollController _scrollcontroller;
  @override
  void initState() {
    _scrollcontroller = ScrollController(
        initialScrollOffset: (widget.index * 600.0), keepScrollOffset: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          "Posts",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
          controller: _scrollcontroller,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                        radius: 25,
                        child: ClipOval(child: Image.asset("assets/4.jpg"))),
                    title: Text("Lionsgateplayin"),
                    subtitle: Text("Sponsored"),
                    trailing: InkWell(
                        onTap: () {
                          // _bottomSheet(context);
                        },
                        child: Icon(Icons.more_vert)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/4.jpg",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    // _isLike = !_isLike;
                                  });
                                },
                                icon: Icon(
                                    // _isLike
                                    // ?
                                    Icons.favorite,
                                    // : Icons.favorite_border,
                                    color:
                                        // _isLike ?
                                        Colors.red
                                    // : Colors.black,
                                    )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 11),
                              child: Icon(Icons.chat_bubble_outline_rounded),
                            ),
                            Transform.rotate(
                                angle: 150,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 11),
                                  child: Icon(Icons.send_outlined),
                                ))
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              // _isArchived = !_isArchived;
                            });
                          },
                          icon: Icon(
                            // _isArchived
                            // ?
                            Icons.bookmark,
                            // : Icons.bookmark_border_outlined,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(text: "Like by "),
                                TextSpan(
                                    text: "Neelpatel",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: " and "),
                                TextSpan(
                                    text: "thousand of others",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: " nagarpalika.memes_ "),
                                TextSpan(
                                    text: "Text",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                              ])),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
