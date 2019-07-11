import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:our_lives/models/image.dart';

class Album {
  final String title;
  final String imagePath;
  final List<Image> images;
  final int totalImages;

  Album({this.title, this.imagePath, this.images, this.totalImages});

  Album.fromSnapshot(DocumentSnapshot snapshot) : this.fromMap(snapshot.data);

  Album.fromMap(Map<dynamic, dynamic> map) 
  : assert(map['title'] != null),
    assert(map['imagePath'] != null),
    assert(map['images'] != null),
    title = map['title'],
    imagePath = map['imagePath'],
    images = (map['images'] as List).map((image) => Image.fromMap(image)).toList(),
    totalImages = (map['images'] as List).length;
}

final memeAlbum = Album(
  title: 'Meme',
  imagePath: 'assets/images/meme.png',
  images: memeImages,
  totalImages: 2,
);

final albums = [
    memeAlbum
];