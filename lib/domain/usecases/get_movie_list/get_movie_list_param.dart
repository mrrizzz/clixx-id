enum MovieListCategory {
  nowPlaying,
  upComing
}


class GetMovieListParam {
  final int page;
  final MovieListCategory category;

  GetMovieListParam({this.page = 1,required this.category});
}