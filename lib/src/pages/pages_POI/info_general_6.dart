import 'package:flutter/material.dart';

class InfoGeneral6 extends StatefulWidget {
  const InfoGeneral6({super.key});

  @override
  State<InfoGeneral6> createState() => _InfoGeneral6State();
}

class _InfoGeneral6State extends State<InfoGeneral6> {
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
                'El Malecón',
                style: TextStyle(fontSize: 35, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),
              Image(image: AssetImage('assets/images/el_malecon.jpg')),
              SizedBox(height: 45.0),
              Text(
                'Ubicación: Girón - Santander \nCoordenadas: 7°03′55.29′′N 73°10′11.89′′O \nTemperatura: Alta 24º C, Baja 17º C \n\nSitio emblemático de la región y turístico por excelencia, muy famoso por sus festivales de orquestas, sus ventas artesanales, sus tradicionales casetas, sus comidas típicas y sus conocidas fritangas donde sobresale la venta de carne de vaca, chorizos, carne de cerdo, carne de cabro y papa. Se destaca por sus atracciones naturales y su vista hacia el imponente Rio de Oro.',
                style: TextStyle(fontSize: 17, fontStyle: FontStyle.normal),
              ),
            ],
          ))),
    );
  }
}
