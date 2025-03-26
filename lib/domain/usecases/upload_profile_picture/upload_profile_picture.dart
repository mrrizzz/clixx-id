import 'package:bioskop/data/repositories/user_repository.dart';
import 'package:bioskop/domain/entities/result.dart';
import 'package:bioskop/domain/entities/user.dart';
import 'package:bioskop/domain/usecases/upload_profile_picture/upload_profile_picture_param.dart';
import 'package:bioskop/domain/usecases/usecase.dart';

class UploadProfilePicture implements UseCase<Result<User>, UploadProfilePictureParam>{
  final UserRepository _userRepository;

  UploadProfilePicture({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<Result<User>> call(UploadProfilePictureParam params) => _userRepository.uploadProfilePicture(
    imageFile: params.imageFile,
    user: params.user,
  );
}