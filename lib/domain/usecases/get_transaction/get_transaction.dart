import 'package:bioskop/data/repositories/transaction_repository.dart';
import 'package:bioskop/domain/entities/result.dart';
import 'package:bioskop/domain/entities/transaction.dart';
import 'package:bioskop/domain/usecases/get_transaction/get_transaction_param.dart';
import 'package:bioskop/domain/usecases/usecase.dart';

class GetTransaction implements UseCase<Result<List<Transaction>>, GetTransactionParam>{
  final TransactionRepository _transactionRepository;

  GetTransaction({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;

  @override
  Future<Result<List<Transaction>>> call(GetTransactionParam params) async {    
    var transactionResult = await _transactionRepository.getUserTransaction(uid: params.uid);
    
    return switch (transactionResult){
      Success(value: final transactions) => Result.success(transactions),
      Failed(: final message) => Result.failed(message),
    };
  }
}