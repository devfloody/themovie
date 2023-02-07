import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themovie/core/env/env.dart';
import 'package:themovie/features/movie/data/movie_pagination.dart';

import '../../../core/core.dart';
import '../domain/models/movie.dart';
import '../domain/models/movie_list.dart';

part 'movie_repository.g.dart';

class MovieRepository {
  final Dio dio;

  MovieRepository({required this.dio});

  Future<List<Movie>> searchMovie({
    required int page,
    String query = '',
    CancelToken? cancelToken,
  }) async {
    final response = await dio.get(
      'search/movie',
      queryParameters: {
        'page': '$page',
        'include_adult': 'false',
        'api_key': Env.apiKey,
        'query': query,
      },
    );
    final data = MovieList.fromJson(response.data);
    return data.results;
  }

  Future<List<Movie>> nowPlayingMovie({
    required int page,
    CancelToken? cancelToken,
  }) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {
        'page': '$page',
        'include_adult': 'false',
        'api_key': Env.apiKey,
      },
    );
    final data = MovieList.fromJson(response.data);
    return data.results;
  }

  Future<List<Movie>> popularMovie({
    required int page,
    CancelToken? cancelToken,
  }) async {
    final response = await dio.get(
      '/movie/popular',
      queryParameters: {
        'page': '$page',
        'include_adult': 'false',
        'api_key': Env.apiKey,
      },
    );
    final data = MovieList.fromJson(response.data);
    return data.results;
  }

  Future<Movie> movie({
    required int movieId,
    CancelToken? cancelToken,
  }) async {
    final response = await dio.get(
      'movie/$movieId',
      queryParameters: {
        'include_adult': 'false',
        'api_key': Env.apiKey,
      },
    );
    final data = Movie.fromJson(response.data);
    return data;
  }
}

@riverpod
MovieRepository movieRepository(MovieRepositoryRef ref) {
  return MovieRepository(
    dio: ref.watch(dioProvider),
  );
}

class AbortedException implements Exception {}

@riverpod
Future<Movie> movie(
  MovieRef ref, {
  required int movieId,
}) {
  final cancelToken = ref.cancelToken();
  return ref
      .watch(movieRepositoryProvider)
      .movie(movieId: movieId, cancelToken: cancelToken);
}

@riverpod
Future<List<Movie>> fetchMovies(
  FetchMoviesRef ref, {
  required MoviePagination pagination,
}) async {
  final moviesRepo = ref.watch(movieRepositoryProvider);

  final cancelToken = CancelToken();

  final link = ref.keepAlive();
  final timer = Timer(const Duration(seconds: 30), () {
    link.close();
  });
  ref.onDispose(() {
    cancelToken.cancel();
    timer.cancel();
  });
  if (pagination.query.isEmpty) {
    return moviesRepo.nowPlayingMovie(
      page: pagination.page,
      cancelToken: cancelToken,
    );
  } else {
    await Future.delayed(const Duration(milliseconds: 500));
    if (cancelToken.isCancelled) throw AbortedException();

    return moviesRepo.searchMovie(
      page: pagination.page,
      query: pagination.query,
      cancelToken: cancelToken,
    );
  }
}

@riverpod
Future<List<Movie>> getPopularMovie(
  GetPopularMovieRef ref, {
  required MoviePagination pagination,
}) async {
  final moviesRepo = ref.watch(movieRepositoryProvider);
  final cancelToken = CancelToken();

  ref.onDispose(() {
    cancelToken.cancel();
  });

  return moviesRepo.popularMovie(
    page: pagination.page,
    cancelToken: cancelToken,
  );
}
