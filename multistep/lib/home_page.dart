import 'package:flutter/material.dart';
import 'package:multistep/register/register_page.dart';

class HomePage extends StatelessWidget {
  final String namedRoute = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, const RegisterPage().namedRoute);
          },
          child: const Text('Inciar Cadastro'),
        ),
      ),
    );
  }
}
