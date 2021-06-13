import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/models/posts_models.dart';
import 'package:instagram_clone/screen/comments_screen.dart';
import 'package:readmore/readmore.dart';

class PostsCard extends StatefulWidget {
  final PostsModel post;
  const PostsCard({@required this.post});

  @override
  _PostsCardState createState() => _PostsCardState();
}

class _PostsCardState extends State<PostsCard> {
  bool _isArchived = false;
  bool _isLike = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
                radius: 25,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageBuilder: (context, imageProvider) => CircleAvatar(
                      radius: 25,
                      backgroundImage: imageProvider,
                    ),
                    imageUrl: widget.post.lowThumbnail,
                    errorWidget: (context, url, error) => SvgPicture.asset(
                      'assets/logo.svg',
                    ),
                    placeholder: (context, url) => SvgPicture.asset(
                      'assets/logo.svg',
                    ),
                  ),
                )),
            title: Text("Lionsgateplayin"),
            subtitle: Text("Sponsored"),
            trailing: InkWell(
                onTap: () {
                  _bottomSheet(context);
                },
                child: Icon(Icons.more_vert)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: CachedNetworkImage(
              imageUrl: widget.post.highThumbnail,
              placeholder: (context, url) => SvgPicture.asset(
                'assets/logo.svg',
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _isLike = !_isLike;
                          });
                        },
                        icon: Icon(
                          _isLike ? Icons.favorite : Icons.favorite_border,
                          color: _isLike ? Colors.red : Colors.black,
                        )),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.chat_bubble_outline_rounded),
                    ),
                    Transform.rotate(
                        angle: 150,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 11),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Icon(Icons.send_outlined, size: 22),
                          ),
                        ))
                  ],
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isArchived = !_isArchived;
                    });
                  },
                  icon: Icon(
                    _isArchived
                        ? Icons.bookmark
                        : Icons.bookmark_border_outlined,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(text: "Like by "),
                            TextSpan(
                                text: "Neelpatel",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: " and "),
                            TextSpan(
                                text: "thousand of others",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: " nagarpalika.memes_ "),
                            TextSpan(
                                text: "Text",
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ])),
                  SizedBox(
                    height: 4,
                  ),
                  ReadMoreText(
                    widget.post.title,
                    trimLength: 50,
                    trimCollapsedText: ' more',
                    trimExpandedText: ' less',
                    style: TextStyle(color: Colors.black),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CommentsScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        "View all Comments",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future _bottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (context) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.5,
              minWidth: MediaQuery.of(context).size.height * 0.4,
            ),
            // height: MediaQuery.of(context).size.height * 0.4,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      color: Colors.grey[400],
                      height: 3,
                      width: 35,
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 15),
                          child: Text(
                            "Report....",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 15),
                          child: Text(
                            "Turn on Post Notifications",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 15),
                          child: Text(
                            "Copy Link",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 15),
                          child: Text(
                            "Share to...",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 15),
                          child: Text(
                            "Unfollow",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 15),
                          child: Text(
                            "Mute",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
