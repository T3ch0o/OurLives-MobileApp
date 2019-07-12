import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:our_lives/api/firebase_service.dart';
import 'package:our_lives/models/album.dart';
import 'package:our_lives/pages/images_page.dart';

import 'album_details_widget.dart';
import 'album_name_widget.dart';

class AlbumCard extends StatelessWidget {
  final Album album;
  final FirebaseService firebaseSerivce;
  final String albumId;

  AlbumCard({this.album, this.firebaseSerivce, this.albumId});

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ImagesPage(album: album, firebaseService: firebaseSerivce, albumId: albumId)));
        },
        child: SizedBox(
            width: 80.0,
            child: Card(
                margin: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 20.0),
                elevation: 9.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Stack(children: <Widget>[
                    Image(image: CachedNetworkImageProvider(album.imagePath), fit: BoxFit.fitWidth),
                    Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: AlbumDetailsWidget(album: album)),
                    Positioned(
                        left: 0,
                        bottom: 90.0,
                        child: AlbumNameWidget(album: album))
                  ]
                ),
              )
            )
          ),
      ),
    );
  }
}
