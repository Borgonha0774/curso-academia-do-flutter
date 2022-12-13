// ignore_for_file: avoid_print

import 'dart:async';

Future<void> main(List<String> args) async {
  /* Para instanciar-mos um stream precisamos de um controller -> no periodic ele fazia todo esse processo*/
  final streamController = StreamController<
      Pessoa>.broadcast(); //instanciando como broadcast para mais ouvintes

  final inputStream =
      streamController.sink; //criando a porta de entrada da minha stream
  final outStream =
      streamController.stream; //criamos a porta de saida da minha stream

  outStream.listen((pessoa) {
    print('Ouvindo os nomes na porta de saida OutStream: ${pessoa.nome}');
  });

  /* Agora precisamos enviar dados para o stream escutar  gera numero de 0 a 21*/
  var pessoas = List.generate(21, (index) => 'Nome_$index');

  for (var pessoa in pessoas) {
    print('Enviando nomes para o input: $pessoa');
    inputStream.add(Pessoa(nome: pessoa));
    await Future.delayed(const Duration(milliseconds: 500));
  }

  /* Podemos fechar a porta de entrada da strem  */
  streamController.close();
}

class Pessoa {
  String nome;
  Pessoa({required this.nome});
}
