import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    required this.imageUrl,
    super.key,
    this.imageAsset = 'assets/images/news.jpg',
  });
  final String? imageUrl;
  final String imageAsset;
  @override
  Widget build(BuildContext context) {
    return imageUrl != null && imageUrl!.isNotEmpty
        ? Image.network(
            imageUrl!,
            fit: BoxFit.cover,
          )
        : Image.asset(
            imageAsset,
            fit: BoxFit.fill,
          );
  }
}
