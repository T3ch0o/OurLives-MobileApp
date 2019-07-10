import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class FirebaseService {
  CollectionReference albums = Firestore.instance.collection('albums');

  StreamController<QuerySnapshot> albumsController = StreamController<QuerySnapshot>();

  Stream<QuerySnapshot> get albumsStream => albumsController.stream;
  StreamSink<QuerySnapshot> get albumsSink => albumsController.sink;

  Stream<QuerySnapshot> getAlbums() {
    return albums.snapshots();
  }

  void addAlbum() {
    // albums.add()
  }

  FirebaseService() {
    getAlbums().listen((albums) {
      albumsSink.add(albums);
    });
  }

  dispose() {
    albumsController.close();
  }
}