import 'package:todo_list_provider/app/core/database/sqlite_connection_factory.dart';

import 'app_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          //criamos uma instancia do bd e adicionamos dentro do nosso provider
          create: (_) => SqliteConnectionFactory(),
          lazy:
              false, //ele é true por defalut então ele segura (preguiçoso) para criação do bd
        ),
      ],
      child: const AppWidget(),
    );
  }
}
