import 'package:bioskop/data/repositories/movie_repository.dart';
import 'package:bioskop/domain/entities/actor.dart';
import 'package:bioskop/domain/entities/result.dart';
import 'package:bioskop/domain/usecases/get_actors/get_actors_param.dart';
import 'package:bioskop/domain/usecases/usecase.dart';

class GetActors implements UseCase<Result<List<Actor>>, GetActorsParam> {
  final MovieRepository _movieRepository;

  GetActors({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  @override
  Future<Result<List<Actor>>> call(GetActorsParam params) async {
    var actorlistResult = await _movieRepository.getActors(id: params.movieId);

    return switch (actorlistResult) {
      Success(value: final actorList) => Result.success(actorList),
      Failed(:final message) => Result.failed(message)
    };
  }
}
