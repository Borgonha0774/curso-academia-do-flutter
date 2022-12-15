// ignore_for_file: avoid_print

import 'dart:async';

void main(List<String> args) {
  buscarAlgo(2)
      .then((value) => print('Mensagem: $value'))
      .catchError((onError) => print('Mensagem: $onError'));
}

Future<String> buscarAlgo(int algo) {
  final completer = Completer<String>();
  Timer(const Duration(seconds: 2), () {
    algo == 0
        ? completer.complete('Numero enviado com sucesso')
        : completer.completeError(
            'Numero enviado com error', StackTrace.current);
  });

  return completer.future;
}
