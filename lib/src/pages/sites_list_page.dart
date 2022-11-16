import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:flutter_application_1/src/models/local_favourite.dart';

import '../../boxes.dart';

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

  var isFavourite = false;

  @override
  void initState() {
    _getLocalFavourite();
    super.initState();
  }

  void _getLocalFavourite() {
    final box = Boxes.getFavouritesBox();
    box.values.forEach((element) {
      if (element.id == widget.site.id) {
        isFavourite = true;
      }
    });
  }

  void _onFavouritesButtonClicked() async {
    var localFavourite = LocalFavourite()
      ..id = widget.site.id
      ..ciudad = widget.site['Ciudad']
      ..departamento = widget.site['Departamento']
      ..description = widget.site['Descripción']
      ..nombre = widget.site['Nombre']
      ..Url_imagen = widget.site["Url_imagen"];

    final box = Boxes.getFavouritesBox();
    if (isFavourite) {
      box.delete(localFavourite.id);
    } else {
      box.put(localFavourite.id, localFavourite);
    }

    setState(() {
      isFavourite = !isFavourite;
    });
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
              fadeInDuration: const Duration(seconds: 1),
              placeholder: const NetworkImage(
                  'https://acegif.com/wp-content/uploads/loading-11.gif'),
              image: NetworkImage(widget.site["Url_imagen"])),
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
        Row(
          children: [
            Expanded(
              child: IconButton(
                alignment: Alignment.center,
                icon: Icon(isFavourite ? Icons.favorite : Icons.favorite_border,
                    size: 30.0),
                color: Colors.red,
                onPressed: (() {
                  _onFavouritesButtonClicked();
                }),
              ),
            ),
          ],
        ),
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
