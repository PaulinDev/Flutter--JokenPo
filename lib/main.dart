import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _imageChoose = AssetImage("images/padrao.png");
  var _msg = "Sua escolha:";
  var _images = [
    "images/pedra.png",
    "images/papel.png",
    "images/tesoura.png",
  ];

  void _play(int choose) {
    var numberRandom = Random().nextInt(_images.length);
    if (choose == numberRandom) {
      _msg = "Empate!";
    } else if (choose == 0) {
      switch (numberRandom) {
        case 1:
          _msg = "Você perdeu :(";
          break;
        case 2:
          _msg = "Você venceu =D";
          break;
      }
    } else if (choose == 1) {
      switch (numberRandom) {
        case 0:
          _msg = "Você venceu =D";
          break;
        case 2:
          _msg = "Você perdeu :(";
          break;
      }
    } else if (choose == 2) {
      switch (numberRandom) {
        case 0:
          _msg = "Você perdeu :(";
          break;
        case 1:
          _msg = "Você venceu =D";
          break;
      }
    }
    setState(() {
      _imageChoose = AssetImage(_images[numberRandom]);
      _msg = _msg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              "Escolha do App:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              textAlign: TextAlign.center,
            ),
          ),
          Image(
            image: this._imageChoose,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              _msg,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _play(0),
                child: Image.asset(
                  "images/pedra.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _play(1),
                child: Image.asset(
                  "images/papel.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _play(2),
                child: Image.asset(
                  "images/tesoura.png",
                  height: 100,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
