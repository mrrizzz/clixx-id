import 'package:bioskop/domain/usecases/getUserBalance/get_user_balance.dart';
import 'package:bioskop/presentation/providers/repositories/user_repository/user_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_user_balance_provider.g.dart';

@riverpod
GetUserBalance getUserBalance(Ref ref) => GetUserBalance(
      userRepository: ref.watch(userRepositoryProvider),
    );