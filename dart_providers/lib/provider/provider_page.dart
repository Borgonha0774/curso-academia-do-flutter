import 'package:dart_providers/provider/produto_model.dart';
import 'package:dart_providers/provider/produto_widget.dart';
import 'package:dart_providers/provider/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserModel>(context); //primeira opção
    //var user = context.read<UserModel>();// é equivalente ao primeiro retorna uma instancia mas não fica ouvindo mudanças
    //Segunda opção extrai somente o que precisamos
    //var imageAvatar =
    //context.select<UserModel, String>(((userModel) => userModel.imgAvatar));

    //Terceira opção faz sentido para o change notifier fica escutando o tempo todo
    //var user = context.wath<UserModel>();
    return Provider(
      create: (_) => ProdutoModel(nome: 'Academia do Flutter'),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Provider'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user.imgAvatar),
                  minRadius: 120,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(user.name),
                      Text('(${user.birthDate})'),
                    ],
                  ),
                ),
                const ProdutoWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
