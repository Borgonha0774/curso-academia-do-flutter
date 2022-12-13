import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/widget/todo_list_logo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* LayoutBuilder -> Quando precisamos das constrain para saber o tamanho de nossa tela com precisão */
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          /* Para podermos fazer as rolagens (keyboard ) */
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth),
              /* 
                      Ele permite que o Column, Listview limitan-se ao espaço da page
                      resolve o problema de infinity height -> column tem exatamente o 
                      tamanho de espaço que ele ocupa com os widgets
                      O filho dele não tem tamanho infinito mas sim o tamanho que ele 
                      precisa ter
                  */
              child: IntrinsicHeight(
                child: Column(
                  /* Definimos o minimo de tamanho que ele pode ter */
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox(
                      height: 10,
                    ),
                    /* Vamos adicionar um elemento que é a nosso LOGO */
                    TodoListLogo(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
