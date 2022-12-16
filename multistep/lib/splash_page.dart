import 'package:flutter/material.dart';
import 'package:multistep/home_page.dart';

class SplashPage extends StatelessWidget {
  final String namedRoute = '/';
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
              'https://img.freepik.com/vetores-gratis/fundo-transparente-onda-azul-moderno_1055-9777.jpg?w=2000'),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, const HomePage().namedRoute);
            },
            child: const Text('Home Page'),
          ),
        ],
      ),
    );
  }
}
