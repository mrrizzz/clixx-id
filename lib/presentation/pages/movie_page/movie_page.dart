import 'package:bioskop/presentation/pages/movie_page/methods/movie_list.dart';
import 'package:bioskop/presentation/providers/movie/now_playing_provider.dart';
import 'package:bioskop/presentation/providers/movie/upcoming_provider.dart';
import 'package:bioskop/presentation/providers/router/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'methods/promotion_list.dart';
import 'methods/search_bar.dart';
import 'methods/user_info.dart';

class MoviePage extends ConsumerWidget {
  final List<String> promotionImageFileNames = const [
    'popcorn.jpg',
    'buy1get1.jpg'
  ];

  const MoviePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userInfo(ref),
            SizedBox(
              height: 40,
            ),
            searchBar(context),
            SizedBox(
              height: 24,
            ),
            ...movieList(
              title: 'Now Playing',
              movies: ref.watch(nowPlayingProvider),
              onTap: (movie) {
                ref.read(routerProvider).pushNamed('detail', extra: movie);
              },
            ),
            SizedBox(
              height: 30,
            ),
            ...promotionList(promotionImageFileNames),
            SizedBox(
              height: 30,
            ),
            ...movieList(
              title: 'Upcoming',
              movies: ref.watch(upcomingProvider),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        )
      ],
    );
  }
}
