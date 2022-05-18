import 'package:flutter/material.dart';
import 'dart:math'; // Biblioteca que fornece a função Random

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dados da Sorte! ;)'),
          backgroundColor: Colors.black,
        ),
        body: _novaPaginaDados(),
      ),
    ),
  );
}

class _novaPaginaDados extends StatefulWidget {
  const _novaPaginaDados({Key? key}) : super(key: key);

  @override
  State<_novaPaginaDados> createState() => new __novaPaginaDadosState();
}

class __novaPaginaDadosState extends State<_novaPaginaDados> {
  // Setar um valor randômico inicial
  int dado1 = 1;
  int dado2 = 1;

  @override
  void initState() {
    // Função que se iniciliza após rodar o programa
    dado1 = randomDado();
    dado2 = randomDado();
    super.initState();
  }

  int randomDado() {
    // Função para randomizar
    int num = Random().nextInt(7);
    if (num == 0) {
      num++;
    }
    return num;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/cassino1.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      // Setar um valor randômico para a variável dado1 após o clique no 1º dado através da função randomDado
                      dado1 = randomDado();
                    });
                  },
                  // Pegar a imagem do 1º dado e atribuir o valor da variável dado1
                  child: Image.asset('images/dado$dado1.png'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      //Setar um valor randômico para a variável dado2 após o clique no 2º dado através da função randomDado
                      dado2 = randomDado();
                    });
                  },
                  // Pegar a imagem do 2º dado e atribuir o valor da variável dado2
                  child: Image.asset('images/dado$dado2.png'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
