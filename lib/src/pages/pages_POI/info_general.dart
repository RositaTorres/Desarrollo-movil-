import 'package:flutter/material.dart';

class InfoGeneral extends StatefulWidget {
  const InfoGeneral({super.key});

  @override
  State<InfoGeneral> createState() => _InfoGeneralState();
}

class _InfoGeneralState extends State<InfoGeneral> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Center(
            child: SingleChildScrollView(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            Text(
              'Parque Nacional del Chicamocha - PANACHI',
              style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.0),
            Image(image: AssetImage('assets/images/img_parque.jpg')),
            SizedBox(height: 45.0),
            Text(
              'Ciudad cercana: Aratoca \nDepartamento: Santander \nTemperatura: entre 22 °C y 25 °C \n\nEl Parque Nacional del Chicamocha, consolidado como uno de los lugares turísticos más importantes de Colombia, ubicado en el lugar más imponente de Santander, el Cañón del Chicamocha. Es un majestuoso lugar en perfecta armonía con la naturaleza. Ubicado en jurisdicción del municipio de Aratoca, en la vía que comunica a Bucaramanga con San Gil a una distancia aproximada de 50 minutos, es un verdadero atractivo turístico; y lo es, porque encontrar en un mismo lugar ecoturismo, deportes extremos, diversión, turismo recreativo, gastronomía, y toda la cultura santandereana, sus raíces y su historia, sólo es posible en este sitio, creado para el disfrute de todas las familias de la región, del país y de todos los visitantes extranjeros.',
              style: TextStyle(fontSize: 17, fontStyle: FontStyle.normal),
            ),
          ],
        ))),
      ),
    );
  }
}
