
import 'package:bioskop/domain/entities/actor.dart';
import 'package:bioskop/domain/entities/result.dart';
import 'package:bioskop/domain/usecases/get_actors/get_actors.dart';
import 'package:bioskop/domain/usecases/get_actors/get_actors_param.dart';
import 'package:bioskop/presentation/providers/usecases/get_actors_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_actors_provider.g.dart';

@riverpod
Future<List<Actor>> actors(Ref ref, {required int movieId}) async {
  GetActors getActors = ref.read(getActorsProvider);

  var actorResult = await getActors(GetActorsParam(movieId: movieId));
  return switch (actorResult) {
    Success(value: final actors) => actors,
    Failed(message: final _) => const [],
  };
}