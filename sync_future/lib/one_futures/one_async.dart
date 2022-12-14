// ignore_for_file: avoid_print

/* Event loop paz o registro do main parte de uma sequencia lógica igual a 
    linguacem C
*/
void main(List<String> args) {
  print('Inciando o Main');
  func1();
  func2();
  print('Finalizando o Main');
}

void func1() {
  print('Iniciando o func 01');
  print('Fazendo algo complexo no func 01');
  print('Finalizando o func 01');
}

void func2() {
  print('Iniciando o func 02');
  print('Fazendo algo complexo no func 02');
  print('Finalizando o func 02');
}
