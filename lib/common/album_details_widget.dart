import 'package:flutter/material.dart';
import 'package:our_lives/clippers/album_details_custom_clipper.dart';
import 'package:our_lives/common/label_value_widget.dart';
import 'package:our_lives/models/album.dart';
import 'package:our_lives/styleguides/text_styles.dart';

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
                        album.totalImages.toString(),
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
              height: 30.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LabelValueWidget(
                  value: '5',
                  label: 'favourites',
                  labelStyle: labelTextStyle,
                  valueStyle: valueTextStyle
                ),
                LabelValueWidget(
                  value: '20',
                  label: 'subscribers',
                  labelStyle: labelTextStyle,
                  valueStyle: valueTextStyle
                )
              ]
            )
          ]
        )
      )
    );
  }
}