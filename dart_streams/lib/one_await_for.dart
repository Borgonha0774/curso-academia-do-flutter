// ignore_for_file: avoid_print

void main(List<String> args) async {
  print('AWAIT FOR');
  /* Para criar uma Stream precisamos de um controller com excessão do periodic*/

  const interval = Duration(microseconds: 1);
  /* Um callback apenas para termos um valor */
  final stream = Stream<int>.periodic(interval, callback);

  /*Este tipo de for ele é ativado qdo o periodic enviar os dados é diferente de um loop infinito  */
  await for (var i in stream) {
    print(i);
  }
}

int callback(int value) {
  return (value + 1) * 2;
}
