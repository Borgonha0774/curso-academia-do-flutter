// ignore_for_file: avoid_print

/* 
  Dart é singthread com eventLoop semenhante ao node Js, faz uso do Isolate
  é como multithreads em uma singlethread

  Event Loop despacha eventos ou mensagens em um programa
  São executadas sequencia determinada um de cada vez FIFO first In first Out

  2 filas (Queues) em execução no eventLoop:
    MICROTASK -> maior prioridadesempre que entrar um processo ele sera executado primeiro
    EVENT QUEUE -> fila padrão de excução processos de leitura: arquivos, http, database etc...
 */
import 'dart:async';

void main(List<String> args) {
  /* Ex. EVENT QUEUE o timer é como um registro asyncrono
    O main tem prioridade total na execução deixando a tarefa(isolate) em segundo plano por isso
    não excutou sequenciamente

    res:. Inicio Main
          Fim Main
          Event - 01
  */
  print('Inicio Main');
  Timer.run(() {
    scheduleMicrotask(() => print('NEW MICROTASK IN QUEUE- 01'));
    print('Event - 01');
  });
  print('Inicio Main');
  Timer.run(() {
    print('Event - 02');
  });
  print('Inicio Main');
  Timer.run(() {
    print('Event - 03');
  });
  print('Fim Main');

  /* Ex. MICROTASK Thread Principal aqui registramos algo no nosso eventLooping
     A prioridade é a execução do microtask antes do queue
  */
  print('Inicio Microtask');
  scheduleMicrotask(() => print('MICROTASK - 01'));
  scheduleMicrotask(() => print('MICROTASK - 02'));

  print('Fim Microtask');
}
