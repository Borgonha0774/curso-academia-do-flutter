// ignore_for_file: avoid_print

void main(List<String> args) async {
  print('SKIP WHILE');
  /* Para criar uma Stream precisamos de um controller com excessão do periodic*/

  const interval = Duration(seconds: 1);
  /* Um callback apenas para termos um valor */
  var stream = Stream<int>.periodic(interval, callback);

  /*
    Toda stream pode apenas ter um unico ouvinte
    porem podemos ter mais  de um ouvinte passando uma caracteristica asBroadcastStream

    dessa forma precisamos fazer o dispose para para a stream
  */

  stream = stream.asBroadcastStream().take(4);

  stream.listen((numero) {
    print('Listen (1) numero: $numero');
  });
  stream.listen((numero) {
    print('Listen (2) numero: $numero');
  });
  stream.listen((numero) {
    print('Listen (3) numero: $numero');
  });
  stream.listen((numero) {
    print('Listen (4) numero: $numero');
  });
}

int callback(int value) {
  print('Valor Callback: $value');
  return (value + 1) * 2;
}
