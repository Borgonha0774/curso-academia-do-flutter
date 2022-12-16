import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('App Bar')),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.airline_seat_flat_angled_outlined))
        ],
      ),
      drawer: const Drawer(
        child: Center(child: Text('Drawer left')),
      ),
      endDrawer: const Drawer(
        child: Center(child: Text('Drawer Right')),
      ),
      body: Center(
        child: Container(
          /* Podemos definir tamanhos do container */
          width: 200,
          height: 200,

          /* Podemos colocar um espaço externo ao container */
          margin: const EdgeInsets.all(10.0),
          /* Podemos colocar um espaço interno ao container */
          padding: const EdgeInsets.all(10.0),

          /* Podemos implementar decorações no container  ao usarmos o 
             boxdecoration ele não aceita a cor fora dele
          */
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.amber,
                  blurRadius: 20,
                  offset: Offset(10, 10),
                ),
                BoxShadow(
                  color: Color.fromARGB(255, 226, 101, 138),
                  blurRadius: 20,
                  offset: Offset(-10, -10),
                )
              ]),
        ),
      ),
    );
  }
}
