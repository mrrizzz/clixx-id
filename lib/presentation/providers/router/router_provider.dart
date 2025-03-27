import 'package:bioskop/presentation/pages/login_page/login_page.dart';
import 'package:bioskop/presentation/pages/main_page.dart';
import 'package:bioskop/presentation/pages/register_page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(Ref ref) => GoRouter(
  routes: [
    GoRoute(
      path: '/main',
      name: 'main',
      pageBuilder: (context, state) => MaterialPage(child: MainPage()),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      pageBuilder: (context, state) => MaterialPage(child: LoginPage()),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterPage(),
    ),
  ],

  initialLocation: '/login',
  debugLogDiagnostics: false,
);
