import 'package:dart_providers/provider/produto_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProdutoWidget extends StatelessWidget {
  const ProdutoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[200],
      child: Text(context.read<ProdutoModel>().nome),
    );
  }
}
