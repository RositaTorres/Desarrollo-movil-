// Imports
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/login_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

enum Menu { logOut }

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sitios Turisticos'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
              onSelected: (Menu item) {
                setState(() {
                  if (item == Menu.logOut) {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ));
                  }
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                    const PopupMenuItem(
                      value: Menu.logOut,
                      child: Text('Cerrar Sesión'),
                    )
                  ])
        ],
      ),
      body: Column(
        children: [
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
