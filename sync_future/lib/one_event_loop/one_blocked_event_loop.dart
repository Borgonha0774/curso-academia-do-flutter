// ignore_for_file: avoid_print

import 'dart:io';
/*  
    O congelamento é errado o processo tela travada 
    Para contornar problemas de congelamento usamos Futures e Streams
*/

void main(List<String> args) {
  print('Iniciando o MAIN');
  print(temperaturActual());
  print(temperaturTomorrow());
  print('Finalizando o MAIN');
}

String temperaturActual() {
  //Congelando a execução
  sleep(const Duration(seconds: 3));
  return 'Está fazendo 30 graus';
}

String temperaturTomorrow() {
  //Congelando a execução
  sleep(const Duration(seconds: 4));
  return 'Amanhã 40 graus';
}
