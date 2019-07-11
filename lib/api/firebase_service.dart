import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:our_lives/models/album.dart';
import 'package:our_lives/models/image.dart';

class FirebaseService {
  CollectionReference albums = Firestore.instance.collection('albums');

  Stream<QuerySnapshot> getAlbums() {
    return albums.snapshots();
  }

  void addAlbum() {
    // albums.add()
  }

  Future uploadImage(Album album, String albumId, File image, String fileName) async {
    StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child('${album.title.toLowerCase()}/${fileName}');
    StorageUploadTask task = firebaseStorageRef.putFile(image);

    var downloadUrlSync = await (await task.onComplete).ref.getDownloadURL();

    String downloadUrl = downloadUrlSync.toString();
    
    _updateAlbumImage(downloadUrl, albumId);
  }

  _updateAlbumImage(String downloadUrl, String albumId) {
    albums.document(albumId).updateData({'images': FieldValue.arrayUnion([{ 'imagePath': downloadUrl, 'likes': 0 }])});
  }
}