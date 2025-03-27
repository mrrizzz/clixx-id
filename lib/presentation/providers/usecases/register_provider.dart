import 'package:bioskop/domain/usecases/register/register.dart';
import 'package:bioskop/presentation/providers/repositories/authetication/authentication_provider.dart';
import 'package:bioskop/presentation/providers/repositories/user_repository/user_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_provider.g.dart';

@riverpod
Register register(Ref ref) => Register(
      authentication: ref.watch(authenticationProvider),
      userRepository: ref.watch(userRepositoryProvider),
    );