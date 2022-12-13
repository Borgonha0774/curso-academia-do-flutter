// ignore_for_file: avoid_print

import 'dart:async';

Future<void> main(List<String> args) async {
  /* Para instanciar-mos um stream precisamos de um controller -> no periodic ele fazia todo esse processo*/
  final streamController = StreamController<
      int>.broadcast(); //instanciando como broadcast para mais ouvintes

  final inputStream =
      streamController.sink; //criando a porta de entrada da minha stream
  final outStream =
      streamController.stream; //criamos a porta de saida da minha stream

  outStream
      .skip(1)
      .where((numero) => numero % 2 == 0)
      .map((numero) => 'O valor par enviado é $numero')
      .listen((strConvertida) {
    print(
        'Ouvindo os numeros na porta de saida OutStream: strConvertida $strConvertida');
  });

  /* Agora precisamos enviar dados para o stream escutar  gera numero de 0 a 21*/
  var numeros = List.generate(21, (index) => index);

  for (var numero in numeros) {
    print('Enviando numero para o input: $numero');
    inputStream.add(numero);
    await Future.delayed(const Duration(milliseconds: 500));
  }

  /* Podemos fechar a porta de entrada da strem  */
  streamController.close();
}
