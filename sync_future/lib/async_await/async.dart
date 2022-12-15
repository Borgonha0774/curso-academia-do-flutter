// ignore_for_file: avoid_print

void main(List<String> args) {
  final resultado = metodoAssincronoSemAsync();
  resultado.then((print)).catchError((onError) {
    print(onError);
  });

  final resultadoAsync = metodoAssincronoComAsync();
  resultadoAsync.then((print)).catchError((onError) {
    print(onError);
  });
}

Future<String> metodoAssincronoSemAsync() {
  return Future.value('Metodo sem async');
}

/* Ao colocarmos o async o proprio dart envelopa semelhante acima 
    tanto para success quanto para error

    devemos sempre declarar o tipo de retorno correto
    nunca declare o retorno sem o: Future<T>
 */
Future<String> metodoAssincronoComAsync() async {
  return 'Metodo com async';
}
