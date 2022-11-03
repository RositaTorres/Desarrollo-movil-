// Imports
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.purple,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: const ListTile(
              title: Text(
                'Sitios Turisticos',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Card(
                  child: ListTile(
                    title: const Text(
                        "1. Parque nacional de chicamocha o panachi"),
                    subtitle: const Text(
                        "Parque temático dedicado al ecoturismo a tan solo 54 km de Bucaramanga "),
                    leading: const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/chicamocha.jpg')),
                    trailing: ElevatedButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, 'InfoGeneral1'),
                      child: const Text('Ver'),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text("2.	Ecoparque Cerro el Santísimo"),
                    subtitle: const Text(
                        "Espectacular parque rodeado de naturaleza y tecnología"),
                    leading: const CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/Ecoparque_Cerro_el_Santísimo.jpeg')),
                    trailing: ElevatedButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, 'InfoGeneral2'),
                      child: const Text('Ver'),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text(
                        "3.	Jardín Botánico Eloy Valenzuela - Bucaramanga"),
                    subtitle: const Text(
                        "Jardín botánico de 7.5 hectáreas de extensión, cuenta con gran biodiversidad vegetal"),
                    leading: const CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/jardin_botanico_eloy_valenzuela.jpg')),
                    trailing: ElevatedButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, 'InfoGeneral3'),
                      child: const Text('Ver'),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text("4.	La Mesa de Los Santos"),
                    subtitle: const Text(
                        "Es una meseta del macizo colombiano, que se caracteriza por la belleza del paisaje"),
                    leading: const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/mesa_de_los_santos.jpg')),
                    trailing: ElevatedButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, 'InfoGeneral4'),
                      child: const Text('Ver'),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title:
                        const Text("5.	Parque Ecológico El Portal - Rionegro"),
                    subtitle: const Text(
                        "Es un sitio para la recreación y el descanso, cuenta con aguas cristalinas, piscina natural y vegetación exuberante"),
                    leading: const CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/Parque_Ecológico_El_Portal.jpg')),
                    trailing: ElevatedButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, 'InfoGeneral5'),
                      child: const Text('Ver'),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title:
                        const Text("6.	 El malecón de Girón parte histórica"),
                    subtitle: const Text(
                        "Sitio emblemático de la región y turístico por excelencia, muy famoso por sus festivales"),
                    leading: const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/el_malecon.jpg')),
                    trailing: ElevatedButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, 'InfoGeneral6'),
                      child: const Text('Ver'),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text(
                        "7.	 La cascada de la judía - Floridablanca"),
                    subtitle: const Text(
                        "Esplendida cascada de aguas frías y cristinas del Rio Frio que viene de la parte alta de Floridablanca"),
                    leading: const CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/cascada_de_la_judia.jpg')),
                    trailing: ElevatedButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, 'InfoGeneral7'),
                      child: const Text('Ver'),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text("8.	 El parque del agua - Bucaramanga"),
                    subtitle: const Text(
                        "Es uno de los sitios de encuentro más importantes de Bucaramanga"),
                    leading: const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/parque_del_agua.jpg')),
                    trailing: ElevatedButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, 'InfoGeneral8'),
                      child: const Text('Ver'),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text("9.	Cascada el ensueño - Piedecuesta"),
                    subtitle: const Text(
                        "Hermosa cascada de aguas frías y cristalinas del Rio Hato, posee 12 metros de altura, su manantial de aguas viene de las altas montañas de Piedecuesta"),
                    leading: const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/Cascada_El_Ensueno.jpg')),
                    trailing: ElevatedButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, 'InfoGeneral9'),
                      child: const Text('Ver'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 16),
            ),
            onPressed: () => Navigator.pushNamed(context, 'list'),
            child: const Text('Ir a favoritos'),
          ),
        ],
      ),
    );
  }
}
