import 'package:bioskop/domain/usecases/get_transaction/get_transaction.dart';
import 'package:bioskop/presentation/providers/repositories/transaction_repository/transaction_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_transactions_provider.g.dart';

@riverpod
GetTransaction getTransaction(Ref ref) => GetTransaction(
      transactionRepository: ref.watch(transactionRepositoryProvider),
    );