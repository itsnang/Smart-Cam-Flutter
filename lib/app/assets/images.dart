import 'package:flutter/material.dart';

class ImageAsset {
  ImageAsset(this.scale, {this.width, this.height, this.color});

  factory ImageAsset.of([
    double? scale,
    double? width,
    double? height,
    Color? color,
  ]) {
    return ImageAsset(scale, width: width, height: height, color: color);
  }

  final double? scale;

  final double? width;

  final double? height;

  final Color? color;

  Image get circularProgressIndicator {
    return Image.asset(
      'assets/images/circular_progress_indicator.gif',
      scale: scale,
      width: width,
      height: height,
    );
  }
}
