import 'package:bioskop/domain/usecases/get_movie_list/get_movie_list.dart';
import 'package:bioskop/presentation/providers/repositories/movie_repository/movie_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movie_list_provider.g.dart';

@riverpod
GetMovieList getMovieList(Ref ref) => GetMovieList(
      movieRepository: ref.watch(movieRepositoryProvider),
    );