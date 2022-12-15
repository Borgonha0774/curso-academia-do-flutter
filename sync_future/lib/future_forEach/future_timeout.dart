// ignore_for_file: avoid_print

/* 
    Podemos monitorar o tempo de recebimento 
    ele informa que não foi terminado no tempo exposto
    mas não conseguimos cancelar o future ele vai ocorrer por baixo
    
  */
void main(List<String> args) {
  final aguardando = inserindoDadosLentamente();
  print(DateTime.now().toIso8601String());
  aguardando
      .timeout(const Duration(seconds: 1),
          onTimeout: () => print('Estourou o tempo de pegar os dados'))
      .catchError((e) {
    print('Excedeu o tempo $e');
  });
}

Future<void> inserindoDadosLentamente() {
  return Future.delayed(const Duration(seconds: 3), () {
    print('Terminou o insert');
    print(DateTime.now().toIso8601String());
  });
}
