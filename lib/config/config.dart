library config.global;

import 'package:flip_card/flip_card_controller.dart';
import 'package:memorama/utilis/detalles.dart';
import 'package:flutter/material.dart';

import '../widgets/tablero.dart';

enum Nivel { imposible, dificil, medio, facil }

List<String> cards() {
  return [
    "images/cloud.png",
    "images/cloud.png",
    "images/day.png",
    "images/day.png",
    "images/dino.png",
    "images/dino.png",
    "images/fish.png",
    "images/fish.png",
    "images/frog.png",
    "images/frog.png",
    "images/moon.png",
    "images/moon.png",
    "images/night.png",
    "images/night.png",
    "images/octo.png",
    "images/octo.png",
    "images/peacock.png",
    "images/peacock.png",
    "images/quest.png",
    "images/quest.png",
    "images/rabbit.png",
    "images/rabbit.png",
    "images/rain.png",
    "images/rain.png",
    "images/rainbow.png",
    "images/rainbow.png",
    "images/seahorse.png",
    "images/seahorse.png",
    "images/shark.png",
    "images/shark.png",
    "images/star.png",
    "images/star.png",
    "images/sun.png",
    "images/sun.png",
    "images/whale.png",
    "images/whale.png",
    "images/wolf.png",
    "images/wolf.png",
    "images/zoo.png",
    "images/zoo.png"
  ];
}

List<Detalles> inicio = [
  Detalles("Facil", Colors.green, Colors.green[200],
      const Tablero(nivel: Nivel.facil), Nivel.facil),
  Detalles("Medio", Colors.yellow, Colors.yellow[200],
      const Tablero(nivel: Nivel.medio), Nivel.medio),
  Detalles("Dificil", Colors.orange, Colors.orange[200],
      const Tablero(nivel: Nivel.dificil), Nivel.dificil),
  Detalles("Imposible negro", Colors.red, Colors.red[400],
      const Tablero(nivel: Nivel.imposible), Nivel.imposible),
];
List <bool> initialState=[];
List <String> cartas=[];
List <FlipCardController> controllers=[];

void inicializar(Nivel nivel){
  List<String> tmp=cards();
  int size=0;
  switch(nivel){
    case Nivel.facil:
      size=12;
      break;
    case Nivel.imposible:
      size=40;
      break;
    case Nivel.dificil:
      size=32;
      break;
    case Nivel.medio:
      size=20;
      break;
  }
  for(int i=0;i<size;i++){
    initialState.add(true);
    cartas.add(cards()[i]);
    controllers.add(FlipCardController());
  }
  cartas.shuffle();
  cartas.shuffle();
}
