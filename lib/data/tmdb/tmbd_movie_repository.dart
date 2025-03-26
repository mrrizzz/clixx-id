import 'package:bioskop/data/repositories/movie_repository.dart';
import 'package:bioskop/domain/entities/actor.dart';
import 'package:bioskop/domain/entities/movie.dart';
import 'package:bioskop/domain/entities/moviedetail.dart';
import 'package:bioskop/domain/entities/result.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TmbdMovieRepository implements MovieRepository{
  final Dio? dio;

  final String accessToken = dotenv.env['TMDB_ACCESS_TOKEN']!;
  late final Options _options = Options(headers: {
    'Authorization': 'Bearer $accessToken',
    'accept': 'application/json',
  });

  TmbdMovieRepository({Dio? dio}) : dio = dio ?? Dio();

  @override
  Future<Result<List<Actor>>> getActors({required int id}) async {
    try {
      final response = await dio!.get(
        'https://api.themoviedb.org/3/movie/$id/credits',
        options: _options,
      );

      if (response.statusCode == 200) {
        final List<Actor> actors = (response.data['cast'] as List)
            .map((e) => Actor.fromJSON(e))
            .toList();

        return Result.success(actors);
      } else {
        return Result.failed('Failed to get actors');
      }
    } catch (e) {
      return Result.failed('Failed to get actors');
    }
  }

  @override
  Future<Result<MovieDetail>> getDetail({required int id}) async {
    try {
      final response = await dio!.get(
        'https://api.themoviedb.org/3/movie/$id?language=en-US',
        options: _options,
      );

      if (response.statusCode == 200) {
        return Result.success(MovieDetail.fromJSON(response.data));
      } else {
        return Result.failed('Failed to get movie detail');
      }
    } 
    on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlaying({int page = 1}) async =>
    _getMovies(_MovieCategory.nowPlaying.toString(), page: page);
  

  @override
  Future<Result<List<Movie>>> getUpComing({int page = 1}) async =>
    _getMovies(_MovieCategory.upComing.toString(), page: page);

  Future<Result<List<Movie>>> _getMovies(String category, {int page = 1}) async {
    try {
      final response = await dio!.get(
        'https://api.themoviedb.org/3/movie/${category}?language=en-US',
        queryParameters: {
          'page': page,
        },
        options: _options,
      );

      if (response.statusCode == 200) {
        final List<Movie> movies = (response.data['results'] as List)
            .map((e) => Movie.fromJSON(e))
            .toList();

        return Result.success(movies);
      } else {
        return Result.failed('Failed to get movies');
      }
    } catch (e) {
      return Result.failed('Failed to get movies');
    }
  }
}

enum _MovieCategory {
  nowPlaying('now_playing'),
  upComing('upcoming');

  final String _instring;

  const _MovieCategory(String inString) : _instring = inString;

  @override
  String toString() {
    return _instring;
  }
}