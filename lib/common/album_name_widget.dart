import 'package:flutter/material.dart';
import 'package:our_lives/models/album.dart';
import 'package:our_lives/shapes/custom_text_shape_border.dart';
import 'package:our_lives/styleguides/colors.dart';
import 'package:our_lives/styleguides/text_styles.dart';

class AlbumNameWidget extends StatelessWidget {
  
  final Album album;

  AlbumNameWidget({this.album});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      elevation: 20.0,
      shape: CustomTextShapeBorder(),
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0, left: 20.0, right: 16.0, bottom: 5.0),
        child: Text(
          album.title,
          style: albumNameTextStyle,
    ),
      ),
    );
  }
}