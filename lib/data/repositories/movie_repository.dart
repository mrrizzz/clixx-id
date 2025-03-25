import 'package:bioskop/domain/entities/actor.dart';
import 'package:bioskop/domain/entities/movie.dart';
import 'package:bioskop/domain/entities/moviedetail.dart';
import 'package:bioskop/domain/entities/result.dart';

abstract interface class MovieRepository {
  Future<Result<List<Movie>>> getNowPlaying({int page =  1});
  Future<Result<List<Movie>>> getUpComing({int page =  1});
  Future<Result<List<Actor>>> getActors({required int id});
  Future<Result<MovieDetail>> getDetail({required int id});
  
}