import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/local_favourite.dart';
import 'package:flutter_application_1/src/pages/favourite_page.dart';
import 'package:flutter_application_1/src/pages/list_page.dart';
import 'package:flutter_application_1/src/pages/login_page.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general.dart';
import 'package:flutter_application_1/src/pages/sites_list_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = 0;
  late List<Widget> pages;

  @override
  void initState() {
    _loadPages();
    super.initState();
  }

  void _loadPages() {
    pages = [];
    pages.add(const ListPage());
    pages.add(const FavoritesPage());
  }

  void _onItemTapped(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destino Colombia'),
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
                          builder: (context) => const LoginPage()));
                }
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem(
                value: Menu.logOut,
                child: Text('Cerrar sesión'),
              ),
            ],
          ),
        ],
      ),
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        type: BottomNavigationBarType.fixed,
        onTap: (page) {
          _onItemTapped(page);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.list, size: 20),
              label: 'Sitios Turisticos'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.heart, size: 20), label: 'Favoritos'),
        ],
      ),
    );
  }
}
