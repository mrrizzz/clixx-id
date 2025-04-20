import 'package:bioskop/domain/usecases/top_up/top_up.dart';
import 'package:bioskop/presentation/providers/repositories/transaction_repository/transaction_repository_provider.dart';
import 'package:bioskop/presentation/providers/repositories/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'top_up_provider.g.dart';

@riverpod
TopUp topUp(TopUpRef ref) => TopUp(
    userRepository: ref.watch(userRepositoryProvider),
    transactionRepository: ref.watch(transactionRepositoryProvider));
