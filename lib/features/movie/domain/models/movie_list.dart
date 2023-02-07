import 'package:freezed_annotation/freezed_annotation.dart';

import 'movie.dart';

part 'movie_list.freezed.dart';
part 'movie_list.g.dart';

@freezed
class MovieList with _$MovieList {
  const factory MovieList({
    required int page,
    required List<Movie> results,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'total_results') int? totalResults,
  }) = _MovieList;

  factory MovieList.fromJson(Map<String, dynamic> json) =>
      _$MovieListFromJson(json);
}
