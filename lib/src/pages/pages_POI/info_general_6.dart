import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoGeneral6 extends StatefulWidget {
  const InfoGeneral6({super.key});

  @override
  State<InfoGeneral6> createState() => _InfoGeneral6State();
}

void _onFavouritesButtonClicked() async {}

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
            children: [
              const Text(
                'El Malecón',
                style: TextStyle(fontSize: 35, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),
              const Image(image: AssetImage('assets/images/el_malecon.jpg')),
              Row(
                children: [
                  Expanded(
                    child: IconButton(
                      alignment: Alignment.centerRight,
                      icon: const Icon(Icons.favorite, size: 30.0),
                      color: Colors.red,
                      onPressed: (() {
                        _onFavouritesButtonClicked();
                      }),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      alignment: Alignment.centerRight,
                      icon: const Icon(FontAwesomeIcons.mapLocationDot,
                          size: 30.0),
                    ),
                  )
                ],
              ),
              const Text(
                'Ubicación: Girón - Santander \nCoordenadas: 7°03′55.29′′N 73°10′11.89′′O \nTemperatura: Alta 24º C, Baja 17º C \n\nSitio emblemático de la región y turístico por excelencia, muy famoso por sus festivales de orquestas, sus ventas artesanales, sus tradicionales casetas, sus comidas típicas y sus conocidas fritangas donde sobresale la venta de carne de vaca, chorizos, carne de cerdo, carne de cabro y papa. Se destaca por sus atracciones naturales y su vista hacia el imponente Rio de Oro.',
                style: TextStyle(fontSize: 17, fontStyle: FontStyle.normal),
              ),
            ],
          ))),
    );
  }
}
