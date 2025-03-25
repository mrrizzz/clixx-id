import 'package:bioskop/data/dummies/dummy_authentication.dart';
import 'package:bioskop/data/dummies/dummy_user_repository.dart';
import 'package:bioskop/domain/usecases/login/login.dart';
import 'package:bioskop/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Login login = Login(
              authentication: DummyAuthentication(),
              userRepository: DummyUserRepository(),
            );
            login(LoginParams(email: 'email', password: 'password')).then((
              result,
            ) {
              if (result.isSuccess) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MainPage(user: result.resultValue!),
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
