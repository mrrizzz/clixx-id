import 'package:bioskop/data/firebase/firebase_transaction_repository.dart';
import 'package:bioskop/data/repositories/transaction_repository.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_repository.g.dart';

@riverpod
TransactionRepository transactionRepository(Ref ref) =>
    FirebaseTransactionRepository();
