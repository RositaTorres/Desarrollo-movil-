import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoGeneral9 extends StatefulWidget {
  const InfoGeneral9({super.key});

  @override
  State<InfoGeneral9> createState() => _InfoGeneral9State();
}

void _onFavouritesButtonClicked() async {}

class _InfoGeneral9State extends State<InfoGeneral9> {
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
                'Cascada El Ensueño',
                style: TextStyle(fontSize: 35, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),
              const Image(
                  image: AssetImage('assets/images/Cascada_El_Ensueno.jpg')),
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
                'Ubicación: Piedecuesta - Santander \nCoordenadas: 7°01′29.74′′N 73°02′21.94′′O \nTemperatura: 28º C \n\nHermosa cascada de aguas frías y cristalinas del Rio Hato, posee 12 metros de altura, su manantial de aguas viene de las altas montañas de Piedecuesta. Está Ubicada en la vereda Mata Baja en el interior de la espesa naturaleza. La poca profundidad de sus aguas hace que sea una de las cascadas más seguras para los visitantes que desean refrescarse y nadar en sus aguas. Cerca se encuentra la tienda doña María, donde se consigue mucho mecato y el tradicional guarapo de frutas.',
                style: TextStyle(fontSize: 17, fontStyle: FontStyle.normal),
              ),
            ],
          ))),
    );
  }
}
