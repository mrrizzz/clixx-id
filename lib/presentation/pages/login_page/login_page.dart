import 'package:bioskop/presentation/providers/usecases/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bioskop/data/dummies/dummy_authentication.dart';
import 'package:bioskop/data/dummies/dummy_user_repository.dart';
import 'package:bioskop/data/firebase/firebase_authentication.dart';
import 'package:bioskop/data/firebase/firebase_user_repository.dart';
import 'package:bioskop/domain/usecases/login/login.dart';
import 'package:bioskop/presentation/pages/main_page.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Login login = ref.watch(loginProvider);
            
            login(
              LoginParams(email: 'johnny@good.com', password: '123456'),
            ).then((result) {
              if (result.isSuccess) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MainPage(user: result.resultValue!),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      result.errorMessage ?? "Login gagal, coba lagi",
                    ),
                  ),
                );
              }
            });
          },
          child: const Text('login'),
        ),
      ),
    );
  }
}
