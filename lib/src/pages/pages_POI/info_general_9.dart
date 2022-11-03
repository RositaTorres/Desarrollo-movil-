import 'package:flutter/material.dart';

class InfoGeneral9 extends StatefulWidget {
  const InfoGeneral9({super.key});

  @override
  State<InfoGeneral9> createState() => _InfoGeneral9State();
}

class _InfoGeneral9State extends State<InfoGeneral9> {
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
                'Cascada El Ensueño',
                style: TextStyle(fontSize: 35, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),
              Image(image: AssetImage('assets/images/Cascada_El_Ensueno.jpg')),
              SizedBox(height: 45.0),
              Text(
                'Ubicación: Piedecuesta - Santander \nCoordenadas: 7°01′29.74′′N 73°02′21.94′′O \nTemperatura: 28º C \n\nHermosa cascada de aguas frías y cristalinas del Rio Hato, posee 12 metros de altura, su manantial de aguas viene de las altas montañas de Piedecuesta. Está Ubicada en la vereda Mata Baja en el interior de la espesa naturaleza. La poca profundidad de sus aguas hace que sea una de las cascadas más seguras para los visitantes que desean refrescarse y nadar en sus aguas. Cerca se encuentra la tienda doña María, donde se consigue mucho mecato y el tradicional guarapo de frutas.',
                style: TextStyle(fontSize: 17, fontStyle: FontStyle.normal),
              ),
            ],
          ))),
    );
  }
}