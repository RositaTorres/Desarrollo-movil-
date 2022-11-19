// ignore_for_file: unused_import

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/local_favourite.dart';
import 'package:flutter_application_1/src/pages/list_page.dart';
import 'package:flutter_application_1/src/pages/map_page.dart';
import 'package:flutter_application_1/src/pages/sites_list_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:flutter_application_1/boxes.dart';

class InfoGeneral extends StatefulWidget {
  const InfoGeneral({super.key});

  @override
  State<InfoGeneral> createState() => _InfoGeneralState();
}

class _InfoGeneralState extends State<InfoGeneral> {
  void _onFavouritesButtonClicked() async {}

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
                'Parque Nacional del Chicamocha - Panachi',
                style: TextStyle(fontSize: 35, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),
              const Image(image: AssetImage('assets/images/chicamocha.jpg')),
              Row(
                children: [
                  Expanded(
                    child: IconButton(
                      alignment: Alignment.topRight,
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
                'Ubicación: Aratoca - Santander \nCoordenadas: 6°47′23″N 73°00′14″O \nTemperatura: Alta 24º C, Baja 15º C, Promedio 22º C \n\nEs un parque temático dedicado al ecoturismo a tan solo 54 km de Bucaramanga y a 39 km de San Gil. Se ubica sobre el Cañón de Chicamocha y está rodeado de hermosos paisajes naturales. En un mismo lugar se pueden encontrar deportes de aventura, turismo recreativo, ecoturismo, gastronomía típica, cultura santandereana, sus raíces y gran riqueza histórica. Cuenta con variedad de atracciones como teleférico, tirolin, pista de patinaje, pista para buggies, jumping, parque de las avestruces, parque de las cabras, monumento a la santandereanidad, mirador, pueblito santandereano, parapente y canotaje.',
                style: TextStyle(fontSize: 17, fontStyle: FontStyle.normal),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
