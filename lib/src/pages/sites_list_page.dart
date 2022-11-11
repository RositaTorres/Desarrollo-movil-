import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';

// ignore: must_be_immutable
class SitesListPage extends StatefulWidget {
  late QueryDocumentSnapshot site;
  SitesListPage(this.site, {super.key});

  @override
  State<SitesListPage> createState() => _SitesListPage();
}

class _SitesListPage extends State<SitesListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(),
      body: placeBody(),
      //drawer: Menu(context),
    );
  }

  myAppbar() {
    return AppBar(
      backgroundColor: Colors.purple,
      centerTitle: true,
      title: const Text(
        'Sitio Turístico',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  placeBody() {
    return SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FadeInImage(
              fadeInDuration: const Duration(seconds: 3),
              placeholder: const NetworkImage(
                  'https://acegif.com/wp-content/uploads/loading-11.gif'),
              image: NetworkImage(widget.site['Url_imagen'])),
        ),
        const SizedBox(
          height: 25,
        ),
        const Text(
          'Información:',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Accordion(
            headerBackgroundColor: Colors.redAccent,
            contentBorderColor: Colors.redAccent,
            openAndCloseAnimation: Accordion.sectionAnimation,
            contentHorizontalPadding: 10,
            children: [
              AccordionSection(
                  header: const Text(
                    'Destino',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  content: Text(widget.site['Nombre'])),
              AccordionSection(
                  header: const Text(
                    'Descripción',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  content: Text(widget.site['Descripción'])),
              AccordionSection(
                  header: const Text(
                    'Ciudad',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  content: Text(widget.site['Ciudad'])),
              AccordionSection(
                  header: const Text(
                    'Departamento',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  content: Text(widget.site['Departamento'])),
            ]),
        const SizedBox(
          height: 15,
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              'Ver en Google Maps',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ))
      ],
    ));
  }
}