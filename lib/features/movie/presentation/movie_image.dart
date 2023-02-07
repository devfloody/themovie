import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({
    Key? key,
    required this.imageUrl,
    required this.height,
    required this.width,
  }) : super(key: key);

  final String imageUrl;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.network(
        '${ApiConstant.imageUrlSmall}$imageUrl',
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Icon(Icons.broken_image_outlined),
          );
        },
      ),
    );
  }
}
