import 'package:flutter/material.dart';

class InfoGeneral5 extends StatefulWidget {
  const InfoGeneral5({super.key});

  @override
  State<InfoGeneral5> createState() => _InfoGeneral5State();
}

class _InfoGeneral5State extends State<InfoGeneral5> {
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
                'Parque Ecológico El Portal',
                style: TextStyle(fontSize: 35, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),
              Image(
                  image: AssetImage(
                      'assets/images/Parque_Ecológico_El_Portal.jpg')),
              SizedBox(height: 45.0),
              Text(
                'Ubicación: Rionegro - Santander \nCoordenadas: 7°19′54.51′′N 73°09′47.77′′O \nTemperatura: 28º C \n\nEs un sitio para la recreación y el descanso, cuenta con aguas cristalinas, piscina natural y circulante, vegetación exuberante, cascada natural de 12 metros de altura, múltiples chorros de agua para hidromasaje, pozos naturales, y más atractivos para visitantes como espacios para camping, hospedaje, pesca deportiva, ciclomontañismo, equitación, spa, senderos ecológicos, Juegos infantiles, bar, bolos, minitejo, moliendas didácticas y polideportivo.',
                style: TextStyle(fontSize: 17, fontStyle: FontStyle.normal),
              ),
            ],
          ))),
    );
  }
}
