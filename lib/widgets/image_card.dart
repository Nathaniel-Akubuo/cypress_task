import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utilities/ui_helpers.dart';

class ImageCard extends StatelessWidget {
  final double? width;
  final double? height;
  final String imageURL;
  final int? primaryColor;
  final BorderRadius? borderRadius;
  final bool expanding;
  final IconData? errorIcon;

  const ImageCard({
    Key? key,
    this.width,
    this.height,
    this.primaryColor,
    required this.imageURL,
    this.borderRadius,
    this.expanding = false,
    this.errorIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: borderRadius ?? k8pxBorderRadius,
          child: imageURL.isEmpty
              ? Container()
              : CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: imageURL,
                  width: expanding ? width : width ?? 100,
                  height: expanding ? height : height ?? 100,
                  errorWidget: (context, url, stacktrace) =>
                      Icon(errorIcon ?? Icons.photo),
                ),
        ),
      ],
    );
  }
}
