import 'package:flutter/painting.dart';

class CustomShapeBorder extends ShapeBorder {
  final double distanceFromWall = 12;
  final double controlPointDistanceFromWall = 2;

  @override
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return null;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return getClip(Size(130.0, 60.0));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
  }

  @override
  ShapeBorder scale(double t) {
    return null;
  }

  Path getClip(Size size) {
    Path clippedPath = Path();

    clippedPath.moveTo(distanceFromWall, 0);
    clippedPath.quadraticBezierTo(controlPointDistanceFromWall,
     controlPointDistanceFromWall, 0, distanceFromWall);
    clippedPath.lineTo(0, size.height - distanceFromWall); 
    clippedPath.quadraticBezierTo(controlPointDistanceFromWall,
     size.height - controlPointDistanceFromWall, distanceFromWall, size.height);
    clippedPath.lineTo(size.width - distanceFromWall, size.height);
    clippedPath.quadraticBezierTo(
      size.width - controlPointDistanceFromWall,
      size.height - controlPointDistanceFromWall,
      size.width,
      size.height - distanceFromWall
    );
    clippedPath.lineTo(size.width, size.height * 0.6);
    clippedPath.quadraticBezierTo(
      size.width - 1,
      size.height * 0.6 - distanceFromWall,
      size.width - distanceFromWall,
      size.height * 0.6 - distanceFromWall - 3
    );
    clippedPath.lineTo(distanceFromWall + 6, 0);

    clippedPath.close();
    return clippedPath;
  }
}