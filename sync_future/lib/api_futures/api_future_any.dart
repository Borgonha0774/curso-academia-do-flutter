// ignore_for_file: avoid_print

void main(List<String> args) {
  print('Init main');
  var f1 = Future.delayed(const Duration(seconds: 2), () => 'f1');
  var f2 = Future.delayed(const Duration(seconds: 2), () => 'f2');
  var f3 = Future.delayed(const Duration(seconds: 4), () => 'f3');
  var f4 = Future.delayed(const Duration(seconds: 1), () => 'f4');
  var f5 = Future.delayed(
      const Duration(seconds: 3), () => Future.error('error na execução'));

  /* 
      O future any retorna o primeiro que finalizar não importa a sequencia
      os outros serão executados e ignorados idependante se tem error ou não  
  
   */
  print(DateTime.now().toIso8601String());
  Future.any(
    [f1, f2, f3, f4, f5],
  ).then((arrayValues) {
    print(DateTime.now().toIso8601String());
    print(arrayValues);
  }).catchError((e) {
    print(DateTime.now().toIso8601String());
    print(e);
  });
  print('End main');
}
