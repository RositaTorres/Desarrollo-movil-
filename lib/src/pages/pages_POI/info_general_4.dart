import 'package:flutter/material.dart';

class InfoGeneral4 extends StatefulWidget {
  const InfoGeneral4({super.key});

  @override
  State<InfoGeneral4> createState() => _InfoGeneral4State();
}

void _onFavouritesButtonClicked() async {}

class _InfoGeneral4State extends State<InfoGeneral4> {
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
                'La Mesa de los Santos',
                style: TextStyle(fontSize: 35, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),
              const Image(
                  image: AssetImage('assets/images/mesa_de_los_santos.jpg')),
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
                ],
              ),
              const Text(
                'Ubicación: Los Santos – Piedecuesta(S) \nCoordenadas: 6°56′33.9′′N 73°02′09′′O \nTemperatura: Alta 25º C, Baja 17º C \n\nEs una meseta del macizo colombiano, posee una altitud de 1700 metros sobre el nivel del mar, que se caracteriza por la belleza del paisaje, su clima fresco y seco y sus destacados miradores como el Salto del Duende y Chicamocha. Cuenta con la estación la Plazuela que posee restaurantes, locales comerciales, cafeterías, tiendas de recuerdos y la réplica de un pueblo santandereano típico del siglo XIX. Un Centro turístico mi Colombia Querida con capilla, plaza de eventos, zona de camping, canchas múltiples, salón de convenciones, museo de arte y artesanías. También se encuentra en su interior la Huerta Biológica y la Hacienda el Roble para los amantes de la naturaleza. Es sede del Mercado Campesino y el Club Acuarela; para la práctica de deportes náuticos.',
                style: TextStyle(fontSize: 17, fontStyle: FontStyle.normal),
              ),
            ],
          ))),
    );
  }
}
