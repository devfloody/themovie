// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $movieRepositoryHash() => r'aa9ba4899ed9bc00ceb9048493ca6463c604774c';

/// See also [movieRepository].
final movieRepositoryProvider = AutoDisposeProvider<MovieRepository>(
  movieRepository,
  name: r'movieRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $movieRepositoryHash,
);
typedef MovieRepositoryRef = AutoDisposeProviderRef<MovieRepository>;
String $movieHash() => r'902e484bbd644039ae46481be16e4f023b772e2f';

/// See also [movie].
class MovieProvider extends AutoDisposeFutureProvider<Movie> {
  MovieProvider({
    required this.movieId,
  }) : super(
          (ref) => movie(
            ref,
            movieId: movieId,
          ),
          from: movieProvider,
          name: r'movieProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : $movieHash,
        );

  final int movieId;

  @override
  bool operator ==(Object other) {
    return other is MovieProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef MovieRef = AutoDisposeFutureProviderRef<Movie>;

/// See also [movie].
final movieProvider = MovieFamily();

class MovieFamily extends Family<AsyncValue<Movie>> {
  MovieFamily();

  MovieProvider call({
    required int movieId,
  }) {
    return MovieProvider(
      movieId: movieId,
    );
  }

  @override
  AutoDisposeFutureProvider<Movie> getProviderOverride(
    covariant MovieProvider provider,
  ) {
    return call(
      movieId: provider.movieId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'movieProvider';
}

String $fetchMoviesHash() => r'6ad66ed440c21b66004371c584c628f43064f631';

/// See also [fetchMovies].
class FetchMoviesProvider extends AutoDisposeFutureProvider<List<Movie>> {
  FetchMoviesProvider({
    required this.pagination,
  }) : super(
          (ref) => fetchMovies(
            ref,
            pagination: pagination,
          ),
          from: fetchMoviesProvider,
          name: r'fetchMoviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $fetchMoviesHash,
        );

  final MoviePagination pagination;

  @override
  bool operator ==(Object other) {
    return other is FetchMoviesProvider && other.pagination == pagination;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pagination.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef FetchMoviesRef = AutoDisposeFutureProviderRef<List<Movie>>;

/// See also [fetchMovies].
final fetchMoviesProvider = FetchMoviesFamily();

class FetchMoviesFamily extends Family<AsyncValue<List<Movie>>> {
  FetchMoviesFamily();

  FetchMoviesProvider call({
    required MoviePagination pagination,
  }) {
    return FetchMoviesProvider(
      pagination: pagination,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Movie>> getProviderOverride(
    covariant FetchMoviesProvider provider,
  ) {
    return call(
      pagination: provider.pagination,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'fetchMoviesProvider';
}

String $getPopularMovieHash() => r'59a7661183f11478c4abca6140514591bbfa2ad2';

/// See also [getPopularMovie].
class GetPopularMovieProvider extends AutoDisposeFutureProvider<List<Movie>> {
  GetPopularMovieProvider({
    required this.pagination,
  }) : super(
          (ref) => getPopularMovie(
            ref,
            pagination: pagination,
          ),
          from: getPopularMovieProvider,
          name: r'getPopularMovieProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $getPopularMovieHash,
        );

  final MoviePagination pagination;

  @override
  bool operator ==(Object other) {
    return other is GetPopularMovieProvider && other.pagination == pagination;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pagination.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetPopularMovieRef = AutoDisposeFutureProviderRef<List<Movie>>;

/// See also [getPopularMovie].
final getPopularMovieProvider = GetPopularMovieFamily();

class GetPopularMovieFamily extends Family<AsyncValue<List<Movie>>> {
  GetPopularMovieFamily();

  GetPopularMovieProvider call({
    required MoviePagination pagination,
  }) {
    return GetPopularMovieProvider(
      pagination: pagination,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Movie>> getProviderOverride(
    covariant GetPopularMovieProvider provider,
  ) {
    return call(
      pagination: provider.pagination,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'getPopularMovieProvider';
}
