import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:our_lives/api/firebase_service.dart';
import 'package:our_lives/common/album_details_items_widget.dart';
import 'package:our_lives/common/app_background.dart';
import 'package:our_lives/common/card_scroll_widget.dart';
import 'package:our_lives/common/images_background.dart';
import 'package:our_lives/models/album.dart';
import 'package:our_lives/styleguides/colors.dart';
import 'package:our_lives/styleguides/text_styles.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:image_picker/image_picker.dart';


class ImagesPage extends StatefulWidget {
  final Album album;
  final FirebaseService firebaseService;
  final String albumId;

  ImagesPage({this.album, this.firebaseService, this.albumId});

  @override
  _ImagesPage createState() => _ImagesPage(album: album, firebaseService: firebaseService);
}


class _ImagesPage extends State<ImagesPage> {
  final FirebaseService firebaseService;

  final Album album;
  double currentPage;

  File image;
  String fileName;

  _ImagesPage({this.album, this.firebaseService});

  Future getImage() async {
    File selectedImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    File compressedFile = await FlutterNativeImage.compressImage(selectedImage.path,
    quality: 80, percentage: 30);

    setState(() {
      image = compressedFile;
      String imageExtension = selectedImage.path.split('.').last;
      fileName = '${album.title.toLowerCase()}_${album.images.length + 2}.${imageExtension}';
    });
  }

  @override
  Widget build(BuildContext context) {
    PreloadPageController controller = PreloadPageController(initialPage: album.images.length);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
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
          ImagesBackground(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 60.0,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
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
              InkWell(
                onTap: () {
                  getImage();
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Material(
                      elevation: 10.0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.add_photo_alternate, color: primaryColor),
                      ),
                      color: Colors.white,
                      shape: CircleBorder(),
                    ),
                  ),
                ),
              ),
                ]
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 45,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 150.0),
                child: AlbumDetailsItemsWidget(
                  valueStyle: whiteValueTextStyle,
                  labelStyle: whiteLabelTextStyle,
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              image == null ? Stack(
                children: <Widget>[
                  CardScrollWidget(currentPage, album),
                  Positioned.fill(
                    child: PreloadPageView.builder(
                      itemCount: album.images.length,
                      controller: controller,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Container();
                      },
                    ),
                  )
                ]
              ) : uploadImageWiget()
            ],
          )
        ],
      )
    );
  }

  Widget uploadImageWiget() {
    return Center(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(60.0),
            child: Image.file(image, height: 350.0, width: 300.0, fit: BoxFit.cover)
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            elevation: 7.0,
            child: Text('Upload'),
            color: primaryColor,
            textColor: Colors.white,
            onPressed: () {
              firebaseService.uploadImage(album, widget.albumId, image, fileName);
              Navigator.pop(context);
              setState(() {
                image = null;
              });
            },
          )
        ],
      ),
    );
  }
}