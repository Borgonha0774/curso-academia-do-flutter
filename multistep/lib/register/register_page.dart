import 'package:flutter/material.dart';
import 'package:multistep/register/steps/one_page.dart';
import 'package:multistep/register/steps/three_page.dart';
import 'package:multistep/register/steps/two_page.dart';

class RegisterPage extends StatefulWidget {
  final String namedRoute = '/register';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var navKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPopNavRegister = navKey.currentState?.canPop() ?? false;
        if (canPopNavRegister) {
          navKey.currentState?.pop();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Registrar cadastro'),
        ),
        body: Navigator(
          initialRoute: '/one',
          key: navKey,
          onGenerateRoute: (settings) {
            var route = settings.name;
            Widget page;
            switch (route) {
              case '/one':
                page = const OnePage();
                break;
              case '/two':
                page = const TwoPage();
                break;
              case '/three':
                page = const ThreePage();
                break;
              default:
                return null;
            }

            return MaterialPageRoute(
                builder: (context) => page, settings: settings);
          },
        ),
      ),
    );
  }
}
