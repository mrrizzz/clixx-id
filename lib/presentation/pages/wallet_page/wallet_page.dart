import 'package:bioskop/presentation/misc/methods.dart';
import 'package:bioskop/presentation/pages/wallet_page/methods/wallet_card.dart';
import 'package:bioskop/presentation/providers/router/router_provider.dart';
import 'package:bioskop/presentation/providers/user_data/user_data_provider.dart';
import 'package:bioskop/presentation/widgets/back_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bioskop/presentation/pages/wallet_page/methods/recent_transactions.dart';

class WalletPage extends ConsumerWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Column(
              children: [
                BackNavigationBar(
                  'My Wallet',
                  onTap: () => ref.read(routerProvider).pop(),
                ),
                verticalSpace(24),
                walletCard(ref),
                verticalSpace(24),
                ...recentTransactions(ref),
              ],
            ),
          )
        ],
      ),
    );
  }
}
