import 'package:flutter/material.dart';
import 'package:our_lives/styleguides/text_styles.dart';

class HeadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Our Lives', style: headingStyle),
          Text('Everything you want in one place!', style: subHeadingStyle)
        ],
      ),
    );
  }
}
