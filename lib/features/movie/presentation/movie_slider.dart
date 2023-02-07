import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:themovie/features/movie/data/movie_pagination.dart';
import 'package:themovie/features/movie/data/movie_repository.dart';

import 'movie_slider_item.dart';

final queryProvider = StateProvider<String>((ref) {
  return '';
});

class MovieSlider extends HookConsumerWidget {
  const MovieSlider({super.key});

  static const pageSize = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(queryProvider);
    final data = ref.watch(
      fetchMoviesProvider(
        pagination: MoviePagination(page: 1, query: query),
      ),
    );
    return SliverToBoxAdapter(
      child: data.when(
        data: (data) {
          if (data.isEmpty) {
            return const Center(
              child: Text("No Movie Data"),
            );
          }
          return CarouselSlider.builder(
            itemCount: data.length,
            itemBuilder: (_, index, __) {
              final movie = data[index];
              return MovieSliderItem(movie: movie);
            },
            options: CarouselOptions(
              height: 200,
              initialPage: 0,
              autoPlay: true,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(
              error.toString(),
            ),
          );
        },
        loading: () {
          return CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (context, index, realIndex) {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade300,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 200,
              initialPage: 0,
              autoPlay: true,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          );
        },
      ),
    );
  }
}
