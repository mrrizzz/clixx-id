import 'package:bioskop/domain/entities/user.dart';
import 'package:flutter/material.dart';


class MainPage extends StatelessWidget {
  final User user;
  const MainPage({ Key? key, required this.user }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MainPage'),),
      body: Center(
        child: Text(user.toString()),
      ),
    );
  }
}
