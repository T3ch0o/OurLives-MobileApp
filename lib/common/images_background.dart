import 'package:flutter/material.dart';
import 'package:our_lives/styleguides/colors.dart';

class ImagesBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        double width = constraint.maxWidth;

        Widget container = Stack(
          children: <Widget>[
            Positioned(
              top: 190.0,
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
