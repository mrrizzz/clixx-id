import 'package:bioskop/domain/usecases/top_up/top_up.dart';
import 'package:bioskop/presentation/providers/repositories/transaction_repository/transaction_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'top_up_provider.g.dart';

@riverpod
TopUp topUp(Ref ref) => TopUp(
      transactionRepository: ref.watch(transactionRepositoryProvider),
    );