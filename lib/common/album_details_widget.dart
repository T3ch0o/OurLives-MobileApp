import 'package:flutter/material.dart';
import 'package:our_lives/models/album.dart';
import 'package:our_lives/styleguides/text_styles.dart';

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
        padding: const EdgeInsets.only(left: 20.0, right: 16.0, top: 30.0, bottom: 12.0),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.4),
                        width: 2.0                                
                      ),            
                    ),
                    height: 40.0,
                    width: 40.0,
                    child: Center(
                      child: Text(
                        album.total.toString(),
                        style: totalImagesStyle
                      ),
                    ),
                  ),
                  Text(
                    'new',
                    style: labelTextStyle
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
            )
          ]
        )
      )
    );
  }
}