import 'package:flutter/material.dart';

class InfoGeneral7 extends StatefulWidget {
  const InfoGeneral7({super.key});

  @override
  State<InfoGeneral7> createState() => _InfoGeneral7State();
}

class _InfoGeneral7State extends State<InfoGeneral7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 60),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              Text(
                'La Cascada de la Judía',
                style: TextStyle(fontSize: 35, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),
              Image(image: AssetImage('assets/images/cascada_de_la_judia.jpg')),
              SizedBox(height: 45.0),
              Text(
                'Ubicación: Floridablanca - Santander \nCoordenadas: 7°04′51.02′′N 73°04′6.9′′O \nTemperatura: Alta 27º C, Baja 20º C \n\nEsplendida cascada de aguas frías y cristinas del Rio Frio que viene de la parte alta de Floridablanca, sitio lleno de naturaleza, cuenta con varios pozos naturales aptos para los bañistas. En su punto de caída el cauce es fuerte y genera remolinos lo cual requiere precaución y toma de medidas preventivas por parte de los visitantes. En su parte baja los pozos no son tan profundos lo cual es ideal para los turistas. Se llega por la ruta hacia el Cerro la Judía, su recorrido es apto para las largas caminatas y el ciclismo en terreno destapado donde predominan la venta de gaseosas y el guarapo de frutas, también se pueden apreciar hermosos cafetales, cultivos de plátano, cebolla y cítricos.',
                style: TextStyle(fontSize: 17, fontStyle: FontStyle.normal),
              ),
            ],
          ))),
    );
  }
}