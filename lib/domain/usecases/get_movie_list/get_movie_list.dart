import 'package:bioskop/data/repositories/movie_repository.dart';
import 'package:bioskop/domain/entities/movie.dart';
import 'package:bioskop/domain/entities/result.dart';
import 'package:bioskop/domain/usecases/get_movie_list/get_movie_list_param.dart';
import 'package:bioskop/domain/usecases/usecase.dart';

class GetMovieList implements UseCase<Result<List<Movie>>, GetMovieListParam>{
  final MovieRepository _movieRepository;

  GetMovieList({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  @override
  Future<Result<List<Movie>>> call(GetMovieListParam params) async {
    var movieResult =     switch (params.category) {
       MovieListCategories.nowPlaying =>
        await _movieRepository.getNowPlaying(page: params.page),
       MovieListCategories.upComing =>
        await _movieRepository.getUpComing(page: params.page),
    };
    return switch (movieResult) {
      Success(value: final movies) => Result.success(movies),
      Failed(: final message) => Result.failed(message)
    };
  }

}