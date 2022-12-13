// ignore_for_file: avoid_print

void main(List<String> args) async {
  print('WHERE');
  /* Para criar uma Stream precisamos de um controller com excessão do periodic*/

  const interval = Duration(microseconds: 1);
  /* Um callback apenas para termos um valor */
  var stream = Stream<int>.periodic(interval, callback);

  /*
    Filtrando dados
    WHERE é semenhante ao skip while 
    WHER passa os que forem true
    SKIPWHILE passa os que forem false
  */
  stream = stream.where(((numero) => numero % 6 == 0)).take(3);
  //stream = stream.skipWhile(((numero) => numero % 6 != 0)).take(3); funciona ao inverso
  stream.listen((numero) {
    print('Listen numero: $numero');
  });
}

int callback(int value) {
  print('Valor Callback: $value');
  return (value + 1) * 2;
}
