import 'package:flutter/material.dart';
import 'package:instagram_clone/screen/myposts.dart';

class GridviewProfile extends StatelessWidget {
  List<String> images = ["4", "4", "4", "4"];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          itemCount: images.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,

            // childAspectRatio: 2/3
          ),
          itemBuilder: (context, index) {
            var imag = images[index];
            return InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Myposts(index)));
              },
              child: Container(
                // color: Colors.black,
                margin: EdgeInsets.all(2),
                child: Image.asset("assets/$imag.jpg"),
              ),
            );
          }),
    );
  }
}
