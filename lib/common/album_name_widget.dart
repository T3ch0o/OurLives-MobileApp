import 'package:flutter/material.dart';
import 'package:our_lives/models/album.dart';
import 'package:our_lives/styleguides/text_styles.dart';

class AlbumNameWidget extends StatelessWidget {
  
  final Album album;

  AlbumNameWidget({this.album});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20.0,
      child: Text(
        album.title,
        style: albumNameTextStyle,
    ),
    );
  }
}