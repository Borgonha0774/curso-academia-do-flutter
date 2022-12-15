// ignore_for_file: avoid_print

void main(List<String> args) {
  print('Init main');
  var f1 = Future.delayed(const Duration(seconds: 1), () => 'f1');
  var f2 = Future.delayed(const Duration(seconds: 1), () => 'f2');
  var f3 = Future.delayed(const Duration(seconds: 3), () => 'f3');
  var f4 = Future.delayed(const Duration(seconds: 1), () => 'f4');
  var f5 = Future.delayed(
      const Duration(seconds: 2), () => Future.error('error na execução'));

  /* 
      WAIT segura até tdo ter finalizado independente de ter error ou não
      Essa função aguarda até o ultimo finalizar para entregar todos os valores 
      simultaneamente 

      O eagerError ele já emite o erro antes de finalizar todo o processo
      para que possamos tomar alguma ação

      O cleanUp ele mostra os que resultaram sucesso foram completos
      ele somente é executado se um dos futures finalizarem com error
    */
  print(DateTime.now().toIso8601String());
  Future.wait([f1, f2, f3, f4, f5],
          eagerError: true,
          cleanUp: ((successValue) => print('completou $successValue')))
      .then((arrayValues) {
    print(DateTime.now().toIso8601String());
    print(arrayValues);
  }).catchError((e) {
    print(DateTime.now().toIso8601String());
    print(e);
  });
  print('End main');
}
