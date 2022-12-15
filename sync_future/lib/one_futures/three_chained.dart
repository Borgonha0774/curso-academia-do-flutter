// ignore_for_file: avoid_print

/* Cadeia de processamento um interno a outra callback for hell */
void main(List<String> args) {
  /* Para evita o callback for hell podemos usar qtos then necessários */
  func1().then((value) => func2(value).then((value) => print(value)));
}

Future<String> func1() {
  return Future.delayed(
      const Duration(seconds: 1), () => '\nDepois de um segundo Parametro 01');
}

Future<String> func2(String param) {
  return Future.value('\nParametro 02 recebido e processado $param');
}
