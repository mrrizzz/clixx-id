import 'package:bioskop/domain/usecases/logout/logout.dart';
import 'package:bioskop/presentation/providers/repositories/authetication/authentication_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_provider.g.dart';

@riverpod
Logout logout (LogoutRef ref) => Logout(authentication: ref.watch(authenticationProvider));