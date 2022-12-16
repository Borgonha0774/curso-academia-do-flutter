import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('PIX. ${MediaQuery.of(context).devicePixelRatio}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Images'),
      ),
      body: Column(
        children: [
          Container(
            width: 180,
            height: 180,
            color: Colors.red,
            child: Image.asset(
              'assets/death.jpg',

              /*  O fit não atua dentro de um center*/
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 180,
            height: 180,
            color: Colors.red,
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFKxlKJHewR-AbvadnZ6TB4BgS81WR6mwPMQ&usqp=CAU',

              /*  O fit não atua dentro de um center*/
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              width: 180,
              height: 180,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/death.jpg'), fit: BoxFit.cover),
              ),
              child: const Text(
                'Imagem como background',
                style: TextStyle(color: Colors.yellow),
              )),
        ],
      ),
    );
  }
}
