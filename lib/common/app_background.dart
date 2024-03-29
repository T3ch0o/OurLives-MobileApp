import 'package:flutter/material.dart';
import 'package:our_lives/styleguides/colors.dart';

class AppBackground extends StatelessWidget {
  final Color firstColor, secondColor, thirdColor;

  AppBackground({this.firstColor, this.secondColor, this.thirdColor});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraint) {
            final height = constraint.maxHeight;
            final width = constraint.maxWidth;

            return Stack(
                children: <Widget>[
                    Container(
                        color: backgroundColor
                    ),
                    Positioned(
                        left: -(height / 2 - width / 2),
                        bottom: height * 0.25,
                        child: Container(
                            height: height,
                            width: height,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: firstColor
                          ),
                      ),
                    ),
                    Positioned(
                        left: width * 0.15,
                        top: -width * 0.5,
                        child: Container(
                            height: width * 1.6,
                            width: width * 1.6,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: secondColor
                          ),
                      ),
                    ),
                    Positioned(
                        right: -width * 0.2,
                        top: -width / 12,
                        child: Container(
                            height: width / 2,
                            width: width / 2,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: thirdColor
                          ),
                      ),
                    )
                ],
            );
        },
    );
  }
}