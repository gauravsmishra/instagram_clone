import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/models/comments_model.dart';
import 'package:instagram_clone/presenters/comments_screen_presenter.dart';
import 'package:instagram_clone/presenters/home_screen_presenter.dart';

class CommentsScreen extends StatefulWidget {
  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen>
    implements CommentsScreenContract {
  CommentsScreenPresenter _presenter;
  List<CommentsModel> _commentsModel;
  bool isLoaded = false;

  @override
  void onGetCommentsSuccess(List<CommentsModel> model) {
    if (model != null) {
      setState(() {
        _commentsModel = model;
        print("Is Loded before $isLoaded");
        isLoaded = true;
        print("Is Loded before $isLoaded");
      });
    } else {
      print("Inside Error");
      // CommonFunction.showToast(model.message);
    }
  }

  @override
  void onGetError(Object errorTxt) {}

  Future<void> getPosts() async {
    await _presenter.getComments();
  }

  @override
  void initState() {
    _presenter = new CommentsScreenPresenter(this);
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Comments",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Transform.rotate(
                  angle: 150,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Icon(
                        Icons.send_outlined,
                        size: 22,
                        color: Colors.black,
                      ),
                    ),
                  )))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: !isLoaded
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: _commentsModel.length,
                    itemBuilder: (context, index) {
                      var item = _commentsModel[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey[100],
                              child: SvgPicture.asset(
                                'assets/logo.svg',
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                          style: TextStyle(color: Colors.black),
                                          children: [
                                            TextSpan(
                                                text: item.username,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                              text: "  ",
                                            ),
                                            TextSpan(
                                              text: item.comments,
                                            ),
                                          ])),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "1d",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Text(
                                        "123 likes",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Text(
                                        "Reply",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
          )
        ],
      ),
    );
  }
}
