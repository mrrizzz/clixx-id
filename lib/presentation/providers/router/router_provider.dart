import 'package:bioskop/domain/entities/movie.dart';
import 'package:bioskop/domain/entities/movie_detail.dart';
import 'package:bioskop/presentation/pages/booking_confirmation_page/booking_confirmation_page.dart';
import 'package:bioskop/presentation/pages/detail_page/detail_page.dart';
import 'package:bioskop/presentation/pages/login_page/login_page.dart';
import 'package:bioskop/presentation/pages/main_page/main_page.dart';
import 'package:bioskop/presentation/pages/register_page/register_page.dart';
import 'package:bioskop/presentation/pages/seat_booking_page/seat_booking_page.dart';
import 'package:bioskop/presentation/pages/time_booking_page/time_booking_page.dart';
import 'package:bioskop/presentation/pages/wallet_page/wallet_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/transaction.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(routes: [
  GoRoute(
    path: '/main',
    name: 'main',
    builder: (context, state) => MainPage(),
  ),
  GoRoute(
    path: '/login',
    name: 'login',
    builder: (context, state) => LoginPage(),
  ),
  GoRoute(
    path: '/register',
    name: 'register',
    builder: (context, state) => const RegisterPage(),
  ),
  GoRoute(
    path: '/detail',
    name: 'detail',
    builder: (context, state) => DetailPage(
      movie: state.extra as Movie,
    ),
  ),
  GoRoute(
    path: '/time-booking',
    name: 'time-booking',
    builder: (context, state) => TimeBookingPage(
      state.extra as MovieDetail,
    ),
  ),
  GoRoute(
    path: '/seat-booking',
    name: 'seat-booking',
    builder: (context, state) => SeatBookingPage(
      transactionDetail: state.extra as (MovieDetail, Transaction),
    ),
  ),
  GoRoute(
    path: '/booking-confirmation',
    name: 'booking-confirmation',
    builder: (context, state) => BookingConfimrationPage(
      transactionDetail: state.extra as (MovieDetail, Transaction),
    ),
  ),
  GoRoute(
    path: '/wallet',
    name: 'wallet',
    builder: (context, state) => const WalletPage(),
  )
], initialLocation: '/login', debugLogDiagnostics: false);