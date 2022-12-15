// ignore_for_file: avoid_print

void main(List<String> args) async {
  print('Inicio');
  final id = await buscarId();
  /*  
      o cacthError  precisa retornar um valor pq o await está aguardando
      ou usamos o tryCacth();
  
  */
  final nome = await buscarNome(id).catchError((error) {
    print('Aconteceu um problema $error');
    return 'Outro nome';
  });

  print('O nome é: $nome');
  print('Fim');
}

Future<int> buscarId() async => 80;
Future<String> buscarNome(int id) async {
  throw Exception();
  // return 'Zezinho da silva ($id)';
}
