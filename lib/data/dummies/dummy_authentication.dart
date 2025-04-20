import 'package:bioskop/data/repositories/authentication.dart';
import 'package:bioskop/domain/entities/result.dart';

class DummyAuthentication implements Authentication {
  @override
  String? getLoggedInUserId() {
    // TODO: implement getLoggedInUserId
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> login({required String email, required String password}) async{
    await Future.delayed(Duration(seconds: 1));
    return Result.success('ID-12345');
    // return Result.failed('Gagal Login!');
  }

  @override
  Future<Result<void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> register({required String email, required String password}) {
    // TODO: implement register
    throw UnimplementedError();
  }
}