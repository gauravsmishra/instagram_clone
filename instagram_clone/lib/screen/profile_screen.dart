import 'package:flutter/material.dart';

import 'gridview_builder.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(
        // initialIndex: _currentIndex,
        length: 2,
        vsync: this);
    super.initState();
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [
      GridviewProfile(),
      Container(
        child: Text("$_currentIndex"),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.lock_outlined, color: Colors.black),
        title: Row(
          children: [
            Text(
              "riafy",
              style: TextStyle(color: Colors.black),
            ),
            Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black)
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add_box_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
              icon: Icon(Icons.list, color: Colors.black), onPressed: () {})
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 7),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        child: CircleAvatar(
                            radius: 45,
                            child:
                                ClipOval(child: Image.asset("assets/4.jpg"))),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Text(
                                "0",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19),
                              ),
                              Text(
                                "Posts",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text(
                                "0",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19),
                              ),
                              Text(
                                "Followers",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text(
                                "0",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19),
                              ),
                              Text(
                                "Following",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "raify",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Status",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey[300])),
                child: Center(
                    child: Text(
                  "Edit Profile",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                )),
              ),
              SizedBox(
                height: 25,
              ),
              TabBar(
                  indicatorWeight: 1,
                  indicatorColor: Colors.black54,
                  labelPadding: EdgeInsets.only(bottom: 10),
                  unselectedLabelColor: Colors.black45,
                  labelColor: Colors.black,
                  controller: _tabController,
                  onTap: (val) {
                    setState(() {
                      _currentIndex = val;
                    });
                  },
                  tabs: [
                    Icon(
                      Icons.grid_on_outlined,
                      // color: Colors.black,
                    ),
                    Icon(
                      Icons.person_pin_outlined,
                      // color: Colors.black,
                    )
                  ]),
              Expanded(
                child: TabBarView(controller: _tabController, children: screen),
              )
            ],
          ),
        ),
      ),
    );
  }
}
