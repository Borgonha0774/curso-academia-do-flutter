// ignore_for_file: avoid_print

void main(List<String> args) {
  /* QUEUE */
  print('Init Main 1');
  Future<String>(() {
    return 'Resultado Future Normal';
  }).then(print);

/* Aqui estamos agendando um squeldule microtask que tem preferencia sobre a queue */
  Future<String>.microtask(() {
    return 'Resultado Future Microtask';
  }).then(print);

  print('End Main 1');

  /* 
      Sequencia de execução sem sync
      Init Main 1
      End Main 1
      Resultado Future Microtask
      Resultado Future Normal
   */
}
