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
  int? clicked=0, preclicked=-1;
  bool? flag=false;
  void initState() {
    // TODO: implement initState
    super.initState();
    cartas = [];
    initialState=[];
    inicializar(widget.nivel!);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: cartas.length,
      shrinkWrap: true,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) => FlipCard(
          direction: FlipDirection.HORIZONTAL,
          onFlip: () {
            if(!flag!){
              preclicked=index;
              clicked=0;
              flag=true;
            }else{
              clicked=index;
              flag=false;
            }
            if(preclicked!=clicked){
              //Volteear las cartas
            }
            if(cartas.elementAt(clicked!)==cartas.elementAt(preclicked!)){
              debugPrint("Clicked: son iguales");
            }else{
              Future.delayed(Duration(seconds: 1),() {
                controllers[clicked!].controller?.toggle();
                controllers[preclicked!].controller?.toggle();
              },);
            }
            debugPrint("Clicked: $preclicked");
            debugPrint("Clicked: $clicked");
          },
          fill: Fill.fillBack,
          flipOnTouch: true,
          controller: controllers[index],
          //autoFlipDuration: const Duration(milliseconds: 500),
          back: Image.asset(cartas[index]),
          front: Image.asset("./images/reverso.png")),
    );
  }
}
