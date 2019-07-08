import 'package:flutter/cupertino.dart';

class AlbumDetailsCustomClipper extends CustomClipper<Path> {
  final double distanceFromWall = 12;
  final double controlPointDistanceFromWall = 2;

  @override
  Path getClip(Size size) {
    final double height = size.height;
    final double halfHeight = size.height * 0.5;
    final double width = size.width;

    Path clippedPath = Path();
    clippedPath.moveTo(0, halfHeight);
    clippedPath.lineTo(0, height - distanceFromWall);
    clippedPath.quadraticBezierTo(controlPointDistanceFromWall,
        height - controlPointDistanceFromWall, distanceFromWall, height);
    clippedPath.lineTo(width, height);
    clippedPath.lineTo(width, 30.0);
    clippedPath.quadraticBezierTo(width - 5, 5.0, width - 35, 15.0);
    clippedPath.close();

    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
 
}