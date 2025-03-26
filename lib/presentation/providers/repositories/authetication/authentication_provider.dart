import 'package:bioskop/data/firebase/firebase_authentication.dart';
import 'package:bioskop/data/repositories/authentication.dart';
// ignore: depend_on_referenced_packages
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

@riverpod
Authentication authentication(Ref ref) =>
    FirebaseAuthentication();
