import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:memorama/config/config.dart';

class Parrilla extends StatefulWidget {
  final Nivel? nivel;
  const Parrilla(this.nivel, {Key? key}) : super(key: key);

  @override
  _ParrillaState createState() => _ParrillaState();
}

class _ParrillaState extends State<Parrilla> {
  @override
  int? preclicked = -1;
  bool? flag = false, habilitado=true;
  void initState() {
    // TODO: implement initState
    super.initState();
    cartas = [];
    initialState = [];
    inicializar(widget.nivel!);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: cartas.length,
      shrinkWrap: true,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (context, index) => FlipCard(
          direction: FlipDirection.HORIZONTAL,
          onFlip: () {
            if (!flag!) {
              preclicked = index;
              flag = true;
            } else {
              flag = false;
              setState(() {
                habilitado=false;
              });
            }
            if (preclicked != index) {
              setState(() {
                habilitado=false;
              });
              if (cartas.elementAt(index) == cartas.elementAt(preclicked!)) {
                debugPrint("Son iguales");
                setState(() {
                  initialState[preclicked!] = false;
                  initialState[index] = false;
                  habilitado=true;
                },);
              } else {
                Future.delayed(
                  Duration(milliseconds: 1000),
                  () {
                    controllers.elementAt(preclicked!).toggleCard();
                    preclicked = index;
                    controllers.elementAt(index).toggleCard();
                    setState(() {
                      habilitado=true;
                    });
                  },
                );
              }
            }
            //Future.delayed(Duration(milliseconds: 200));
          },
          fill: Fill.fillBack,
          flipOnTouch: habilitado!? initialState[index]:false,
          controller: controllers[index],
          //autoFlipDuration: const Duration(milliseconds: 500),
          back: Image.asset(cartas[index]),
          front: Image.asset("./images/reverso.png")),
    );
  }
}
