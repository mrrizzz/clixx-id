import 'package:bioskop/data/repositories/movie_repository.dart';
import 'package:bioskop/data/tmdb/tmbd_movie_repository.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_repository_provider.g.dart';

@riverpod
MovieRepository movieRepository(Ref ref) => TmbdMovieRepository();