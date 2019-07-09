import 'package:flutter/material.dart';

import 'package:our_lives/common/app_background.dart';
import 'package:our_lives/common/heading_widget.dart';
import 'package:our_lives/common/horizontal_tab_layout.dart';
import 'package:our_lives/styleguides/colors.dart';
import 'package:our_lives/styleguides/text_styles.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: <Widget>[
              AppBackground(
                firstColor: firstCirleColor,
                secondColor: secondCirleColor,
                thirdColor: thirdCirleColor
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 55.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Material(
                        elevation: 10.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(Icons.menu, color: primaryColor),
                        ),
                        color: Colors.white,
                        shape: CircleBorder(),
                      ),
                    ),
                  ),
                  HeadingWidget(),
                  SizedBox(
                    height: 80.0,
                  ),
                  HorizontalTabLayout(),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                      child: Text('New Album', style: buttonStyle),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0))
                      ),
                    ),
                  )
                ]
              ),
          ],
      )
    );
  }
}