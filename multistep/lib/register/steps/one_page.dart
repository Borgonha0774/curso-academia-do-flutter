import 'package:flutter/material.dart';
import 'package:multistep/register/model/register_model.dart';

class OnePage extends StatefulWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  final nameEC = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    nameEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        const SizedBox(height: 40),
        Text(
          'Step One',
          style: Theme.of(context).textTheme.headline4,
        ),
        TextFormField(
          controller: nameEC,
          decoration: const InputDecoration(labelText: 'Nome'),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
            onPressed: () {
              var model = RegisterModel(name: nameEC.text);
              Navigator.pushNamed(context, '/two', arguments: model);
            },
            child: const Text('Próximo passo'))
      ]),
    );
  }
}
