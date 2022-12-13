// ignore_for_file: avoid_print

void main(List<String> args) async {
  print('SKIP');
  /* Para criar uma Stream precisamos de um controller com excessão do periodic*/

  const interval = Duration(microseconds: 1);
  /* Um callback apenas para termos um valor */
  var stream = Stream<int>.periodic(interval, callback);

  /* SKIP-> Ele pula as primeiras informações que chegam de acordo
    com a quantidade regra imposta pleo skip

    Neste exemplo podemos ver que ele pulou os quatro primeiros valores e ´
    só depois permitiu a passagem dos outros limitado pelo take
  */
  stream = stream.take(5).skip(3);

  /*Este tipo de for ele é ativado qdo o periodic enviar os dados é diferente de um loop infinito  */
  await for (var i in stream) {
    print(i);
  }
}

int callback(int value) {
  print('Valor Callback: $value');
  return (value + 1) * 2;
}
