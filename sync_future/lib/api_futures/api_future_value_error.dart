// ignore_for_file: avoid_print

void main(List<String> args) {
  /* Future tem três estados: Incompleto, completo com sucesso e completo com error */

  // Future(); ele está incompleto vai ser executado ainda e ele encapsula o .value ou o .error
  Future.value(); //success status de completo de sucesso
  Future.error(''); //error status completo de erro
}

/* podemos usar esses metodos em retorno de funções */
Future<String> func1() {
  return Future.value('Qualqquer valor de sucesso');
}

/* O abaixo é semelhante ao acima ocorre a mesma coisa coisa por baixo dos panos */
Future<String> func2() async {
  return 'Qualqquer valor de sucesso';
}
