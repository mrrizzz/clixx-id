import 'package:bioskop/domain/entities/movie.dart';
import 'package:bioskop/presentation/misc/constants.dart';
import 'package:flutter/widgets.dart';

List<Widget> background(Movie movie) => [
      Image.network(
        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          backgroundColor.withOpacity(1),
          backgroundColor.withOpacity(0.7),
        ], begin: Alignment(0, 0.3), end: Alignment.topCenter)),
      )
    ];
