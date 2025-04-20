import 'package:bioskop/data/repositories/authentication.dart';
import 'package:bioskop/domain/entities/result.dart';
import 'package:bioskop/domain/usecases/usecase.dart';

class Logout implements UseCase<Result<void>, void> {
  final Authentication _authentication;

  Logout({required Authentication authentication})
    : _authentication = authentication;
  @override
  Future<Result<void>> call(void _) {
    return _authentication.logout();
  }
}