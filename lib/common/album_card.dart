import 'package:flutter/material.dart';
import 'package:our_lives/models/album.dart';

class AlbumCard extends StatelessWidget {

  final Album album;

  AlbumCard({this.album});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280.0,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Stack(
            children: <Widget>[
              Image.asset(
                album.imagePath,
                fit: BoxFit.fitWidth
              )
            ]
          ),
        )
      )
    );
  }
}