// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:multistep/register/model/register_model.dart';

class ThreePage extends StatefulWidget {
  const ThreePage({Key? key}) : super(key: key);

  @override
  State<ThreePage> createState() => _ThreePageState();
}

class _ThreePageState extends State<ThreePage> {
  final siteEC = TextEditingController();
  late RegisterModel registerModel;

  @override
  void dispose() {
    super.dispose();
    siteEC.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      registerModel =
          ModalRoute.of(context)?.settings.arguments as RegisterModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        const SizedBox(height: 40),
        Text(
          'Step Three',
          style: Theme.of(context).textTheme.headline4,
        ),
        TextFormField(
          controller: siteEC,
          decoration: const InputDecoration(labelText: 'Site'),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
            onPressed: () {
              var model = registerModel.copyWith(site: siteEC.text);
              print(model);
            },
            child: const Text('Cadastrar'))
      ]),
    );
  }
}
