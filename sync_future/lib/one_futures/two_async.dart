// ignore_for_file: avoid_print

/* Event loop paz o registro do main parte de uma sequencia lógica igual a 
    linguacem C

    O event loop tem a inteligencia de analizar qdo algo está em
    processamento e ou esta finalizado

    Futures: 2 estados -> Em processamento e finalizado(com ou sem erro)

    O event loop respeita os processos finalizados
  */
import 'dart:async';

void main(List<String> args) {
  print('Inciando o Main');
  func1();
  func2();
  print('Finalizando o Main');
}

void func1() {
  print('Iniciando o func 01');
  Timer.run(() => print('QUEUE Fazendo algo complexo no func 01'));

  Future.delayed(const Duration(seconds: 2),
      () => print('FUTURE TWO SECONDS Fazendo algo complexo no func 01'));
  print('Finalizando o func 01');
}

void func2() {
  print('Iniciando o func 02');
  Timer.run(() => print('QUEUE Fazendo algo complexo no func 02'));
  Future.delayed(const Duration(seconds: 1),
      () => print('FUTURE ONE SECONDS Fazendo algo complexo no func 02'));
  print('Finalizando o func 02');
}
