import 'package:our_lives/models/image.dart';

class Album {
  final String title;
  final String imagePath;
  final List<Image> images;
  final int totalImages;

  Album({this.title, this.imagePath, this.images, this.totalImages});
}

final memeAlbum = Album(
  title: 'Meme',
  imagePath: 'assets/images/meme.png',
  images: memeImages,
  totalImages: 20
);

final albums = [
    memeAlbum
];