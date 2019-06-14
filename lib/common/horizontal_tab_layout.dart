import 'package:flutter/material.dart';
import 'package:our_lives/styleguides/text_styles.dart';

class HorizontalTabLayout extends StatefulWidget {
  @override
  _HorizontalTabLayoutState createState() => _HorizontalTabLayoutState();
}

class _HorizontalTabLayoutState extends State<HorizontalTabLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
              Text(
                  'Albums',
                  style: selectedTabStyle
              )
        ],
      ),
    );
  }
}