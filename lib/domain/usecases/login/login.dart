import 'package:bioskop/data/repositories/authentication.dart';
import 'package:bioskop/data/repositories/user_repository.dart';
import 'package:bioskop/domain/entities/result.dart';
import 'package:bioskop/domain/entities/user.dart';
import 'package:bioskop/domain/usecases/usecase.dart';

part 'login_params.dart';

class Login implements UseCase<Result<User>, LoginParam> {
  final Authentication authentication;
  final UserRepository userRepository;

  Login({required this.authentication, required this.userRepository});

  @override
  Future<Result<User>> call(LoginParam params) async {
    var idResult = await authentication.login(
      email: params.email,
      password: params.password,
    );

    if (idResult is Success) {
      var userResult = await userRepository.getUser(uid: idResult.resultValue!);

      return switch (userResult) {
        Success(value: final user) => Result.success(user),
        Failed(: final message) => Result.failed(message)
      };
    } else {
      return Result.failed(idResult.errorMessage!);
    }
  }
}
