// ignore_for_file: avoid_print

void main(List<String> args) async {
  print('TAKE WHILE');
  /* Para criar uma Stream precisamos de um controller com excessão do periodic*/

  const interval = Duration(microseconds: 1);
  /* Um callback apenas para termos um valor */
  var stream = Stream<int>.periodic(interval, callback);

  /* TAKE WHILE-> Ele controla o valor do dado enviado pela stream e não a quantidade de vezes enviado commo
    no TAKE: Podemos Transformar ou controlar os dados enviados pela STREAM ex. ele enviara até que o valor enviado
    atinge o limite exposto pelo while

    Neste exemplo podemos ver que ele aceitou apenas uma chamada pq o valor é menor = que 10
    TAKE WHILE analiza o valor que está chegando e não a quantidade na saída
  */
  stream = stream.takeWhile((int value) => value <= 10);

  /*Este tipo de for ele é ativado qdo o periodic enviar os dados é diferente de um loop infinito  */
  await for (var i in stream) {
    print(i);
  }
}

int callback(int value) {
  return (value + 1) * 2;
}
