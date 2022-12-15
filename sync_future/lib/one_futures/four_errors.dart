// ignore_for_file: avoid_print

/* Cadeia de processamento um interno a outra callback for hell */
void main(List<String> args) {
  func1()
      .then((value) => func2())
      .then((value) => func3(), onError: (error) {
        print('Error na função 02');
        return 'Corrigir função 02 ou executar proximas funcões na cadeia';
      })
      .then((print))
      .catchError((onError) => print('Error em alguma das chamadas $onError'));
}

Future<String> func1() {
  print('func1');
  return Future.value('\nParametro 01 recebido e processado');
}

Future<String> func2() {
  print('func2');
  throw Exception();
  return Future.value('\nParametro 02 recebido e processado');
}

Future<String> func3() {
  print('func3');
  return Future.value('\nParametro 03 recebido e processado');
}
