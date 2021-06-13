import 'dart:ui';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';

import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool ishideSearchicon = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenHeight>(
      builder: (context, _res, child) {
        return Scaffold(
          appBar: AppBar(
            leadingWidth: ishideSearchicon ? 30 : 0,
            leading: ishideSearchicon
                ? BackButton(
                    color: Colors.black,
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                    },
                  )
                : SizedBox.shrink(),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Container(
              height: 33,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // border: Border.all(color: Colors.grey),
                  color: Colors.grey[200]),
              child: Row(
                children: [
                  _res.isOpen
                      ? SizedBox.shrink()
                      : Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextField(
                      maxLines: 1,
                      autofillHints: [],
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                      ),
                      onTap: () {
                        setState(() {
                          ishideSearchicon = true;
                        });
                      },
                      onEditingComplete: () {
                        setState(() {
                          ishideSearchicon = false;
                        });
                      },

                      // onChanged: (val) {
                      //   setState(() {
                      //     if (val.isNotEmpty) {
                      //       ishideSearchicon = true;
                      //     } else {
                      //       ishideSearchicon = false;
                      //     }
                      //   });
                      // },
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              _res.isOpen
                  ? SizedBox.shrink()
                  : Icon(
                      Icons.qr_code,
                      color: Colors.grey,
                    )
            ],
            // Text("Search screen"),
          ),
        );
      },
    );
  }
}
