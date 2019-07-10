import 'package:cloud_firestore/cloud_firestore.dart';

class Image {
  final String imagePath;
  final int likes;

  Image({this.imagePath, this.likes});

  Image.fromSnapshot(DocumentSnapshot snapshot) : this.fromMap(snapshot.data);

  Image.fromMap(Map<dynamic, dynamic> map) 
  : assert(map['imagePath'] != null),
    assert(map['likes'] != null),
    imagePath = map['imagePath'],
    likes = map['likes'];

}

final memeImages = [
  Image(
    imagePath: 'assets/images/meme.png',
    likes: 5
  ),
  Image(
    imagePath: 'assets/images/profile.jpg',
    likes: 8
  )
];