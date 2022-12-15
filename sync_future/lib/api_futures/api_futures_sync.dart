// ignore_for_file: avoid_print

void main(List<String> args) {
  /* print('Init Main 1');
  Future<String>(() {
    print('Função Future Executada 1');
    return 'Resultado Future 1';
  }).then(print);

  print('End Main 1'); */

  /* 
      Sequencia de execução sem sync
      ela executa na mesma ordem 
      Init Main 1
      End Main 1
      Função Future Executada 1
      Resultado Future 1  
   */

  print('Init Main 2');
  Future<String>.sync(() {
    print('Função Future Executada 2');
    return 'Resultado Future 2';
  }).then(print);

  print('End Main 2');

  /* 
      Sequencia de execução sem sync
      Init Main 1
      End Main 1
      Função Future Executada 1
      Resultado Future 1  
   */
}
