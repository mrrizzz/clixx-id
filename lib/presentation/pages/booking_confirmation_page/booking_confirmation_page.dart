import 'package:bioskop/domain/entities/result.dart';
import 'package:bioskop/domain/entities/transaction.dart';
import 'package:bioskop/domain/usecases/create_transaction/create_transaction.dart';
import 'package:bioskop/domain/usecases/create_transaction/create_transaction_param.dart';
import 'package:bioskop/presentation/extensions/build_context_extensions.dart';
import 'package:bioskop/presentation/extensions/int_extensions.dart';
import 'package:bioskop/presentation/misc/constants.dart';
import 'package:bioskop/presentation/misc/methods.dart';
import 'package:bioskop/presentation/pages/booking_confirmation_page/methods/transaction_row.dart';
import 'package:bioskop/presentation/providers/transaction_data/transaction_data_provider.dart';
import 'package:bioskop/presentation/providers/usecases/create_transaction_provider.dart';
import 'package:bioskop/presentation/providers/user_data/user_data_provider.dart';
import 'package:bioskop/presentation/widgets/back_navigation_bar.dart';
import 'package:bioskop/presentation/widgets/network_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../domain/entities/movie_detail.dart';
import '../../providers/router/router_provider.dart';

class BookingConfimrationPage extends ConsumerWidget {
  final (MovieDetail, Transaction) transactionDetail;

  const BookingConfimrationPage({required this.transactionDetail, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var (movieDetail, transaction) = transactionDetail;

    transaction = transaction.copyWith(
      total: transaction.ticketAmount! * transaction.ticketPrice! +
          transaction.adminFee,
    );

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
            child: Column(
              children: [
                BackNavigationBar(
                  'Booking Confirmation',
                  onTap: () => ref.read(routerProvider).pop(),
                ),
                verticalSpace(24),
                NetworkImageCard(
                  width: MediaQuery.of(context).size.width - 48,
                  height: (MediaQuery.of(context).size.width - 48) * 0.6,
                  borderRadius: 15,
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500${movieDetail.backdropPath ?? movieDetail.posterPath}',
                  fit: BoxFit.cover,
                ),
                verticalSpace(24),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 48,
                  child: Text(
                    transaction.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                verticalSpace(5),
                const Divider(color: ghostWhite),
                verticalSpace(5),
                transactionRow(
                    title: 'Showing Date',
                    value: DateFormat('EEEE, d MMMM y').format(
                        DateTime.fromMillisecondsSinceEpoch(
                            transaction.watchingTime ?? 0)),
                    width: MediaQuery.of(context).size.width - 48),
                transactionRow(
                    title: 'Theater',
                    value: '${transaction.theaterName}',
                    width: MediaQuery.of(context).size.width - 48),
                transactionRow(
                    title: 'Seat Numbers',
                    value: transaction.seats.join(', '),
                    width: MediaQuery.of(context).size.width - 48),
                transactionRow(
                    title: '# of Tickets',
                    value: '${transaction.ticketAmount} ticket(s)',
                    width: MediaQuery.of(context).size.width - 48),
                transactionRow(
                    title: 'Ticket Price',
                    value: '${transaction.ticketPrice?.toIDRCurrencyFormat()}',
                    width: MediaQuery.of(context).size.width - 48),
                transactionRow(
                    title: 'Adm. Fee',
                    value: transaction.adminFee.toIDRCurrencyFormat(),
                    width: MediaQuery.of(context).size.width - 48),
                const Divider(color: ghostWhite),
                transactionRow(
                    title: 'Total Price',
                    value: transaction.total.toIDRCurrencyFormat(),
                    width: MediaQuery.of(context).size.width - 48),
                verticalSpace(40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        int transactiontime =
                            DateTime.now().millisecondsSinceEpoch;

                        transaction = transaction.copyWith(
                          transactionTime: transactiontime,
                          id: 'flx-$transactiontime-${transaction.uid}',
                        );

                        CreateTransaction createTransaction =
                            ref.read(createTransactionProvider);

                        await createTransaction(CreateTransactionParam(
                                transaction: transaction))
                            .then((result) {
                          switch (result) {
                            case Success(value: _):
                              ref
                                  .read(transactionDataProvider.notifier)
                                  .refreshTransactionData();
                              ref
                                  .read(userDataProvider.notifier)
                                  .refreshUserData();
                              ref.read(routerProvider).goNamed('main');
                            case Failed(:final message):
                              context.showSnackBar(message);
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: backgroundColor,
                          backgroundColor: saffron,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text('Pay Now')),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
