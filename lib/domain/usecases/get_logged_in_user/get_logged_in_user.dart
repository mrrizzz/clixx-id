import 'package:bioskop/data/repositories/authentication.dart';
import 'package:bioskop/data/repositories/user_repository.dart';
import 'package:bioskop/domain/entities/result.dart';
import 'package:bioskop/domain/entities/user.dart';
import 'package:bioskop/domain/usecases/usecase.dart';

class GetLoggedInUser implements UseCase<Result<User>, void>{
  final Authentication _authentication;
  final UserRepository _userRepository;

  GetLoggedInUser({required Authentication authentication, required UserRepository userRepository})
      : _authentication = authentication,
        _userRepository = userRepository;

  @override
  Future<Result<User>> call(void _) async {
    var loggedInUid = _authentication.getLoggedInUserId();
    if (loggedInUid != null) {
      var userResult = await _userRepository.getUser(uid: loggedInUid);

      if (userResult.isSuccess) {
        return Result.success(userResult.resultValue!);
      }else{
        return Result.failed(userResult.errorMessage!);
      }
    } else {
      return Result.failed('No user logged in');
    }
  }
}