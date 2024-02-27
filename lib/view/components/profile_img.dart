import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String image;

  const ProfileImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: image,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(value: downloadProgress.progress)),
      errorWidget: (context, url, error) => const Card(
        child: Icon(
          Icons.person,
          size: 32,
        ),
      ),
    );
  }
}
