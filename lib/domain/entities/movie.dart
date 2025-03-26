import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';

@freezed
abstract class Movie with _$Movie {
  factory Movie({required int id, required String title, String? posterPath}) =
      _Movie;

  factory Movie.fromJSON(Map<String, dynamic> json) => Movie(
    id: json['id'] as int,
    title: json['title'] as String,
    posterPath: json['poster_path'] as String?,
  );
}
