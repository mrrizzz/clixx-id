import 'package:bioskop/domain/entities/result.dart';
import 'package:bioskop/domain/entities/transaction.dart';
import 'package:bioskop/domain/entities/user.dart';
import 'package:bioskop/domain/usecases/get_transaction/get_transaction.dart';
import 'package:bioskop/domain/usecases/get_transaction/get_transaction_param.dart';
import 'package:bioskop/presentation/providers/usecases/get_transaction_provider.dart';
import 'package:bioskop/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_data_provider.g.dart';

@Riverpod(keepAlive: true)
class TransactionData extends _$TransactionData {
  @override
  Future<List<Transaction>> build() async {
    User? user = ref.read(userDataProvider).valueOrNull;

    if (user != null) {
      state = const AsyncLoading();

      GetTransaction getTransactions = ref.read(getTransactionsProvider);

      var result = await getTransactions(GetTransactionParam(uid: user.uid));

      if (result case Success(value: final transactions)) {
        return transactions;
      }
    }

    return const [];
  }

  Future<void> refreshTransactionData() async {
    User? user = ref.read(userDataProvider).valueOrNull;

    if (user != null) {
      state = AsyncLoading();

      GetTransaction getTransactions = ref.read(getTransactionsProvider);

      var result = await getTransactions(GetTransactionParam(uid: user.uid));

      switch (result) {
        case Success(value: final transaction):
          state = AsyncData(transaction);
        case Failed(:final message):
          state = AsyncError(FlutterError(message), StackTrace.current);
          state = AsyncData(state.valueOrNull ?? const []);
      }
    }
  }
}
