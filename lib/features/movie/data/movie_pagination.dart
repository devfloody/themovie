class MoviePagination {
  final int page;
  final String query;

  MoviePagination({
    required this.page,
    required this.query,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MoviePagination &&
      other.page == page &&
      other.query == query;
  }

  @override
  int get hashCode => page.hashCode ^ query.hashCode;
}
