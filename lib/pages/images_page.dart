import 'package:flutter/material.dart';
import 'package:our_lives/common/album_details_items_widget.dart';
import 'package:our_lives/common/app_background.dart';
import 'package:our_lives/common/images_background.dart';
import 'package:our_lives/models/album.dart';
import 'package:our_lives/styleguides/colors.dart';
import 'package:our_lives/styleguides/text_styles.dart';

class ImagesPage extends StatefulWidget {
  final Album album;

  ImagesPage({this.album});

  @override
  _ImagesPage createState() => _ImagesPage(album: album);
}


class _ImagesPage extends State<ImagesPage> {
  final Album album;
  double currenPage;

  _ImagesPage({this.album});

  @override
  Widget build(BuildContext context) {
    currenPage = album.totalImages.toDouble();
   
    PageController controller = PageController(initialPage: album.totalImages);
    controller.addListener(() {
      setState(() {
        currenPage = controller.page;
      });
    });

    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(
            firstColor: firstCirleImagesPageColor,
            secondColor: secondCirleImagesPageColor,
            thirdColor: thirdCirleImagesPageColor
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 60.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 150.0),
                child: AlbumDetailsItemsWidget(
                  valueStyle: whiteValueTextStyle,
                  labelStyle: whiteLabelTextStyle,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              ImagesBackground(),
              Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: PageView.builder(
                      itemCount: album.totalImages,
                      controller: controller
                    ),
                  )
                ]
              )
            ],
          )
        ],
      )
    );
  }
}