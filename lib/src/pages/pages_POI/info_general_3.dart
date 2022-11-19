import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoGeneral3 extends StatefulWidget {
  const InfoGeneral3({super.key});

  @override
  State<InfoGeneral3> createState() => _InfoGeneral3State();
}

void _onFavouritesButtonClicked() async {}

class _InfoGeneral3State extends State<InfoGeneral3> {
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
                'Jardín Botánico Eloy Valenzuela',
                style: TextStyle(fontSize: 35, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),
              const Image(
                  image: AssetImage(
                      'assets/images/jardin_botanico_eloy_valenzuela.jpg')),
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
                'Ubicación: Floridablanca - Santander \nCoordenadas: 7°04′07.2′′N 73°05′23.7′′O \nTemperatura: 22º C \n\nJardín botánico de 7.5 hectáreas de extensión, cuenta con gran biodiversidad vegetal, más de 400 especies de flora propia y un herbario con 3500 pliegos de plantas. Posee un corredor biológico y natural que forma el río Frio. Tiene especies como la ardilla, morrocoyes, 250 especies de mariposas, aves variadas, patos, iguanas, camaleones, armadillos y tinajos entre otros. Es un sitio tranquilo y acogedor, cuenta con guías ambientales que promueven la preservación de los recursos naturales. Tiene un centro de investigación científica enfocado en el estudio y desarrollo de métodos y técnicas para la propagación de especies y restauración de los ecosistemas.',
                style: TextStyle(fontSize: 17, fontStyle: FontStyle.normal),
              ),
            ],
          ))),
    );
  }
}
