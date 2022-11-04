import 'package:flutter/material.dart';

class InfoGeneral2 extends StatefulWidget {
  const InfoGeneral2({super.key});

  @override
  State<InfoGeneral2> createState() => _InfoGeneral2State();
}

class _InfoGeneral2State extends State<InfoGeneral2> {
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
                'Ecoparque Cerro el Santísimo',
                style: TextStyle(fontSize: 35, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),
              Image(
                  image: AssetImage(
                      'assets/images/Ecoparque_Cerro_el_Santísimo.jpeg')),
              SizedBox(height: 45.0),
              Text(
                'Ubicación: Floridablanca - Santander \nCoordenadas: 7°04′11′′N 73°04′15′′O \nTemperatura: 23º C \n\nEspectacular parque rodeado de naturaleza y tecnología, posee una escultura artística del santísimo de 40 toneladas y 38 metros de alto aproximadamente, posee modernos ascensores panorámicos que llegan a una plataforma ubicada a 40 metros de altura desde donde se obtiene una vista de 360º de la ciudad y área metropolitana. Se disfruta de aire fresco y posee teleférico, dos museos, plaza de eventos y espectáculos, zona de baños, locales comerciales y recorrido gastronómico.',
                style: TextStyle(fontSize: 17, fontStyle: FontStyle.normal),
              ),
            ],
          ))),
    );
  }
}
