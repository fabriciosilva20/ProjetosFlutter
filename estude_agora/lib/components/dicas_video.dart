import 'package:flutter/material.dart';

class DicasVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 1,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        itemBuilder: (BuildContext context, int index) {
          // if (index % 2 == 0) {
            return _buildCarousel(context, 2);
          // } else {
          //   return Divider();
          // }
        },
      ),
    );
  }
}

Widget _buildCarousel(BuildContext context, int carouselIndex) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      // Text('Carousel $carouselIndex'),
      SizedBox(
        // you may want to use an aspect ratio here for tablet support
        height: 200.0,
        child: PageView.builder(
          itemCount: 10,
          // store this controller in a State to save the carousel scroll position
          controller: PageController(viewportFraction: 0.8),
          itemBuilder: (BuildContext context, int itemIndex) {
            return InkWell(
              onTap: () {
                print('object');
              },
              child: _buildCarouselItem(context, carouselIndex, itemIndex),
            );
          },
        ),
      )
    ],
  );
}

Widget _buildCarouselItem(
    BuildContext context, int carouselIndex, int itemIndex) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 4.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    ),
  );
}
