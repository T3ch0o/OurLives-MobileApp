import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:our_lives/models/album.dart';

class CardScrollWidget extends StatelessWidget {
  final double currentPage;
  final Album album;
  static final double cardAspectRatio = 12.0 / 16.0;
  final double widgetApectRatio = cardAspectRatio * 1.2; 
  final double padding = 20.0;
  final double verticalInset = 20.0;

  CardScrollWidget(this.currentPage, this.album);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetApectRatio,
      child: currentPage == null ? Container() : LayoutBuilder(
        builder: (context, contraints) {
          double width = contraints.maxWidth;
          double height = contraints.maxHeight;

          double safeWidth = width - 2 * padding;
          double safeHeight = height - 2 * padding;
          
          double heightOfPrimaryCard = safeHeight;
          double widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

          double primaryCardLeft = safeWidth - widthOfPrimaryCard;
          double horizontalInset = primaryCardLeft / 2;

          List<Widget> cardList = new List();

          for (int i = 0; i < album.totalImages; i++) {
            double delta = i - currentPage;
            bool isOnRight = delta > 0;

            double start = padding - 40 + max(primaryCardLeft - horizontalInset * -delta * (isOnRight ? 15 : 1), 0);

            Widget cardItem = Positioned.directional(
              top: padding + verticalInset * max(-delta, 0),
              bottom: padding + verticalInset * max(-delta, 0),
              start: start,
              textDirection: TextDirection.rtl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60.0),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image(image: CachedNetworkImageProvider(album.images[i].imagePath), fit: BoxFit.cover)
                    ]
                  ),
                ),
              ),
            );

            cardList.add(cardItem);
          }

          return Stack(
            children: cardList
          );
        },
      )
    );
  }
}