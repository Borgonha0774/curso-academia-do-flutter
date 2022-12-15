// ignore_for_file: avoid_print

Future<void> main(List<String> args) async {
  final nomes = ['Rodrigo', 'Paulo', 'Pedro', 'Carlos'];

  /* 
      Antes era feito em um loop forEach (javascript) o forEach não respeita o await
      por sugestão o forEach nunca deverá ser utilizado a alternativa é usar o for in  
  */
/*   nomes.forEach((nome) async {
    final saudacaoNome = await saudacao(nome);
    print(saudacaoNome);
  }); */

  /* for (var nome in nomes) {
    final saudacaoNome = await saudacao(nome);
    print(saudacaoNome);
  } */

  await Future.forEach<String>(nomes, (nome) async {
    await saudacao(nome);
  });
}

Future<String> saudacao(String nome) async {
  print('Inicio saudação $nome');
  return Future.delayed(const Duration(seconds: 1), () {
    print('Fim saudação $nome');
    return 'Olá $nome';
  });
}
