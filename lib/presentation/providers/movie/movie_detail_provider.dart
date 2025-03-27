import 'package:bioskop/domain/entities/movie.dart';
import 'package:bioskop/domain/entities/moviedetail.dart';
import 'package:bioskop/domain/entities/result.dart';
import 'package:bioskop/domain/usecases/get_movie_detail/get_movie_detail.dart';
import 'package:bioskop/domain/usecases/get_movie_detail/get_movie_detail_param.dart';
import 'package:bioskop/presentation/providers/usecases/get_movie_detail_provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_detail_provider.g.dart';

@riverpod
Future<MovieDetail?> movieDetail(Ref ref,
    {required Movie movie}) async {
  GetMovieDetail getMovieDetail = ref.read(getMovieDetailProvider);

  var movieDataResult = await getMovieDetail(GetMovieDetailParam(movie: movie));

  return switch (movieDataResult) {
    Success(value: final movieDetail) => movieDetail,
    Failed(message: _) => null,
  };
}