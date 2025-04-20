import 'package:bioskop/domain/entities/movie.dart';
import 'package:bioskop/domain/entities/movie_detail.dart';
import 'package:bioskop/presentation/misc/constants.dart';
import 'package:bioskop/presentation/pages/detail_page/methods/background.dart';
import 'package:bioskop/presentation/pages/detail_page/methods/cast_and_crew.dart';
import 'package:bioskop/presentation/pages/detail_page/methods/movie_overview.dart';
import 'package:bioskop/presentation/pages/detail_page/methods/movie_short_info.dart';
import 'package:bioskop/presentation/providers/movie/movie_detail_provider.dart';
import 'package:bioskop/presentation/providers/router/router_provider.dart';
import 'package:bioskop/presentation/widgets/back_navigation_bar.dart';
import 'package:bioskop/presentation/widgets/network_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  final Movie movie;

  const DetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var asyncMovieDetail = ref.watch(movieDetailProvider(movie: movie));
    return Scaffold(
      body: Stack(
        children: [
          ...background(movie),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackNavigationBar(
                      movie.title,
                      onTap: () => ref.read(routerProvider).pop(),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    NetworkImageCard(
                      width: MediaQuery.of(context).size.width - 48,
                      height: (MediaQuery.of(context).size.width - 48) * 0.6,
                      borderRadius: 15,
                      imageUrl: asyncMovieDetail.valueOrNull != null
                          ? 'https://image.tmdb.org/t/p/w500${asyncMovieDetail.value!.backdropPath ?? movie.posterPath}'
                          : null,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 24),
                    ...movieShortInfo(
                        asyncMovieDetail: asyncMovieDetail, context: context),
                    SizedBox(height: 20),
                    ...movieOverview(asyncMovieDetail),
                    SizedBox(height: 40),
                  ],
                ),
              ),
              ...castAndCrew(movie: movie, ref: ref),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                child: ElevatedButton(
                  onPressed: () {
                    MovieDetail? movieDetail = asyncMovieDetail.valueOrNull;
                    if (movieDetail != null) {
                      ref
                          .read(routerProvider)
                          .pushNamed('time-booking', extra: movieDetail);
                    }
                  },
                  child: Text('Book this movie'),
                  style: ElevatedButton.styleFrom(
                      foregroundColor: backgroundColor,
                      backgroundColor: saffron,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
