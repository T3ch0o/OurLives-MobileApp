import 'package:flutter/material.dart';
import 'package:our_lives/models/album.dart';

class AlbumDetailsWidget extends StatelessWidget {

  final Album album;

  AlbumDetailsWidget({this.album});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      color: Colors.white
    );
  }
}