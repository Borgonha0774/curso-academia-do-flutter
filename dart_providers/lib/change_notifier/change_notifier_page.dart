import 'package:dart_providers/change_notifier/provider_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({super.key});

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 5));

      // ignore: use_build_context_synchronously
      context.read<ProviderController>().alterarDados();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Build Change Notifier');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /* Esse metodo atualiza só a image */
              Selector<ProviderController, String>(
                selector: (_, controller) => controller.imgAvatar,
                builder: ((_, imgAvatar, child) {
                  print('Provider COntroller: (imgAvatar)');
                  return FittedBox(
                    fit: BoxFit.contain,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(imgAvatar),
                      minRadius: 60,
                    ),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /* O watch builda toda a page e não faz sentido para isso usamos o consumer
                      no print ele mostra as duas chamadas
                    */
                    /*  Text(context.watch<ProviderController>().name),
                    Text('(${context.watch<ProviderController>().birthDate})'), */
                    /* O consumer conforme os prints ai ouvir alfuma alteração no ProviderController
                    não altera a page inteira mas altera todos os valores
                    para que q possamos ser mais especificos podemos usar o Sellector */
                    Selector<ProviderController, String>(
                      selector: (_, controller) => controller.name,
                      builder: ((_, name, child) {
                        print('Provider Controller: (name)');
                        return Text(name);
                      }),
                    ),
                    Selector<ProviderController, String>(
                      selector: (_, controller) => controller.birthDate,
                      builder: ((_, birthDate, child) {
                        print('Provider Controller: (birthDate)');
                        return Text(birthDate);
                      }),
                    ),

                    /* Consumer<ProviderController>(
                      builder: ((_, controller, child) {
                        print('Provider Controller: (birthDate)');
                        return Text(controller.birthDate);
                      }),
                    ), */
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<ProviderController>().alterarNome();
                  },
                  child: const Text('Alterar Nome'))
            ],
          ),
        ),
      ),
    );
  }
}
