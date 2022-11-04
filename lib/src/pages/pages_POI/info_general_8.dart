import 'package:flutter/material.dart';

class InfoGeneral8 extends StatefulWidget {
  const InfoGeneral8({super.key});

  @override
  State<InfoGeneral8> createState() => _InfoGeneral8State();
}

class _InfoGeneral8State extends State<InfoGeneral8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              Text(
                'El Parque del Agua',
                style: TextStyle(fontSize: 35, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),
              Image(image: AssetImage('assets/images/parque_del_agua.jpg')),
              SizedBox(height: 45.0),
              Text(
                'Ubicación: Bucaramanga - Santander \nCoordenadas: 7°07′52.89′′N 73°06′35.1′′O \nTemperatura: Alta 26º C, Baja 18º C \n\nEs uno de los sitios de encuentro más importantes de Bucaramanga, amplio sector rodeado de naturaleza alrededor del tema del agua, donde hay presentaciones artísticas y culturales, variada oferta gastronómica y shows todas las noches ideales para compartir en familia. Es la sede del Acueducto Metropolitano de Bucaramanga y en sus terrenos se encuentran los tanques de almacenamiento de la Planta Morrorico que era uno de los sitios de recreación del siglo pasado.',
                style: TextStyle(fontSize: 17, fontStyle: FontStyle.normal),
              ),
            ],
          ))),
    );
  }
}
