import 'package:flutter/material.dart';
import 'package:our_lives/models/album.dart';

import 'clippers/album_details_custom_clipper.dart';

class AlbumDetailsWidget extends StatelessWidget {

  final Album album;

  AlbumDetailsWidget({this.album});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AlbumDetailsCustomClipper(),
      child: Container(
        height: 180.0,
        color: Colors.white
      )
    );
  }
}