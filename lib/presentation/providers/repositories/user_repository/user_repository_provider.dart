import 'package:bioskop/data/firebase/firebase_user_repository.dart';
import 'package:bioskop/data/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository_provider.g.dart';

@riverpod
UserRepository userRepository (UserRepositoryRef ref) =>
 FirebaseUserRepository();