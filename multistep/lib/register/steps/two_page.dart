import 'package:flutter/material.dart';
import 'package:multistep/register/model/register_model.dart';

class TwoPage extends StatefulWidget {
  const TwoPage({Key? key}) : super(key: key);

  @override
  State<TwoPage> createState() => _TwoPageState();
}

class _TwoPageState extends State<TwoPage> {
  final emailEC = TextEditingController();
  late RegisterModel registerModel;

  @override
  void dispose() {
    super.dispose();
    emailEC.dispose();
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
          'Step Two',
          style: Theme.of(context).textTheme.headline4,
        ),
        TextFormField(
          controller: emailEC,
          decoration: const InputDecoration(labelText: 'Email'),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
            onPressed: () {
              var model = registerModel.copyWith(email: emailEC.text);
              Navigator.pushNamed(context, '/three', arguments: model);
            },
            child: const Text('Próximo passo'))
      ]),
    );
  }
}
