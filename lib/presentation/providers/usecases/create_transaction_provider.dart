import 'package:bioskop/domain/usecases/create_transaction/create_transaction.dart';
import 'package:bioskop/presentation/providers/repositories/transaction_repository/transaction_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_transaction_provider.g.dart';

@riverpod
CreateTransaction createTransaction(Ref ref) => CreateTransaction(
      transactionRepository: ref.watch(transactionRepositoryProvider),
    );