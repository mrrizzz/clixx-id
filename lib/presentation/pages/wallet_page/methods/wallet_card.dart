import 'package:bioskop/presentation/pages/wallet_page/methods/card_content.dart';
import 'package:bioskop/presentation/pages/wallet_page/methods/card_pattern.dart';
import 'package:bioskop/presentation/pages/wallet_page/methods/membership_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget walletCard(WidgetRef ref) => Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10)),
      child: Stack(children: [
        cardPattern(),
        membershipBanner(),
        cardContent(ref),
      ]),
    );
