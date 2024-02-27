import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String image;
  final double? size;
  const ProfileImage({super.key, required this.image, required this.size});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      width: size! / 2,
      height: size! / 2,
      imageUrl: image,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(value: downloadProgress.progress)),
      errorWidget: (context, url, error) => Icon(
        Icons.person,
        size: size,
      ),
    );
  }
}
