import 'package:flutter/material.dart';
import 'package:our_lives/styleguides/colors.dart';

class ImagesBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        double width = constraint.maxWidth;
        double deviceHeight = MediaQuery.of(context).size.height;
        double marginHeight = deviceHeight.toInt() < 700 ? 180.0 : 200.0;

        Widget container = Stack(
          children: <Widget>[
            Positioned(
              top: marginHeight,
              child: Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(100.0))),
                width: width,
                height: 500.0
              )
            )
          ]
        );

        return container;
      },
    );
  }
}
