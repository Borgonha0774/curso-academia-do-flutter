// ignore_for_file: avoid_print

void main(List<String> args) {
  /* FUTURE -> 2 Estados: Incompleto, completo com ou sem erro */
  //um future deve ser retornado em uma funcão de callback como o then
  var valor = Future(() {
    /* função asyncrona */
  })
      .then(
    (value) => print(
        value), //quando o future for completado ele executa essa função com SUCESSO
  )
      .catchError((e) {
    //quando o future for completado ele executa essa função com ERROR
  }).whenComplete(() {
    /* semelhante ao finally executa sempre com ou sem erro */
  });

  print(
      valor); //retorna uma instancia de future uma promessa de retorno de valor
}
