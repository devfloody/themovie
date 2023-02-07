import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../domain/models/movie.dart';
import 'movie_image.dart';

class MovieSliderItem extends StatelessWidget {
  const MovieSliderItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MovieImage(
          height: 200,
          width: double.infinity,
          imageUrl: "${movie.backdropPath}",
        ),
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black87,
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieImage(
                imageUrl: "${movie.posterPath}",
                height: 112,
                width: 72,
              ),
              const SizedBox(height: 8),
              Text(
                movie.title,
                overflow: TextOverflow.ellipsis,
                style: AppFont.plusJakartaSemibold.copyWith(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 18,
                  ),
                  Text(
                    "${movie.voteAverage} (${movie.voteCount})",
                    style: AppFont.plusJakartaRegular.copyWith(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
