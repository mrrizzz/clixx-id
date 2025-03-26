import 'package:bioskop/data/repositories/transaction_repository.dart';
import 'package:bioskop/data/repositories/user_repository.dart';
import 'package:bioskop/domain/entities/result.dart';
import 'package:bioskop/domain/entities/transaction.dart';
import 'package:bioskop/domain/usecases/create_transaction/create_transaction.dart';
import 'package:bioskop/domain/usecases/create_transaction/create_transaction_param.dart';
import 'package:bioskop/domain/usecases/top_up/top_up_param.dart';
import 'package:bioskop/domain/usecases/usecase.dart';

class TopUp implements UseCase<Result<void>, TopUpParam> {
  final TransactionRepository _transactionRepository;

  TopUp({
    required UserRepository userRepository,
    required TransactionRepository transactionRepository,
  }) : _transactionRepository = transactionRepository;

  @override
  Future<Result<void>> call(TopUpParam params) async {
    CreateTransaction createTransaction = CreateTransaction(
      transactionRepository: _transactionRepository,
    );

    int transactionTime = DateTime.now().millisecondsSinceEpoch;

    var createTransactionResult = await createTransaction(
      CreateTransactionParam(
        transaction: Transaction(
          uid: 'flxtp-$transactionTime-${params.userId}',
          title: 'Top Up',
          adminFee: 0,
          total: -params.amount,
          transactionTime: transactionTime,
        ),
      ),
    );

    return switch (createTransactionResult) {
      Success() => Result.success(null),
      Failed() => Result.failed('Failed to top up'),
    };
  }
}
