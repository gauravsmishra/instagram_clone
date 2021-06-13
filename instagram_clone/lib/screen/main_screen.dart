import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/presenters/home_screen_presenter.dart';
import 'package:instagram_clone/widgets/posts_card.dart';

import '../models/posts_models.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> implements HomeScreenContract {
  bool _isArchived = false;
  bool _isLike = false;
  HomeScreenPresenter _presenter;
  List<PostsModel> _postsModel;
  bool isLoaded = false;

  @override
  void initState() {
    _presenter = new HomeScreenPresenter(this);
    super.initState();
    getPosts();
  }

  @override
  void onGetPostsSuccess(List<PostsModel> model) {
    if (model != null) {
      setState(() {
        _postsModel = model;
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
    await _presenter.getPosts();
  }

  Widget mystories() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          height: 65,
          width: 65,
          margin: EdgeInsets.only(
            left: 7,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Stack(
            children: [
              CircleAvatar(
                  radius: 30, child: SvgPicture.asset("assets/logo.svg")),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                      border: Border.all(color: Colors.white, width: 1.5)),
                  child: Icon(
                    Icons.add,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )),
      Text("your stories")
    ]);
  }

  Widget stories(
    String name,
    String image,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 65,
            margin: EdgeInsets.only(left: 7),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Colors.red)),
            padding: EdgeInsets.all(3),
            child: CircleAvatar(
                radius: 30, child: SvgPicture.asset("assets/$image.svg"))),
        Text("$name")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Icon(
            Icons.add_box_outlined,
            color: Colors.black,
          ),
          title: Text(
            "Instagram",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            Icon(
              Icons.send_outlined,
              color: Colors.black,
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 100,
              // color: Colors.black12,
              child: Center(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return mystories();
                      } else {
                        return stories("ngfn", "logo");
                      }
                    }),
              ),
            ),
            Expanded(
              child: !isLoaded
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: _postsModel.length,
                      itemBuilder: (context, index) {
                        print("Length ${_postsModel.length}");
                        var item = _postsModel[index];
                        return PostsCard(post: item);
                      }),
            )
          ],
        ));
  }
}
