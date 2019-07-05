import 'package:our_lives/models/image.dart';

class Album {
  final String title;
  final String imagePath;
  final List<Image> images;

  Album({this.title, this.imagePath, this.images});
}

final memeAlbum = Album(
  title: 'Meme',
  imagePath: 'assets/images/meme.png',
  images: memeImages
);

final albums = [
    memeAlbum
];