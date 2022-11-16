import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/local_favourite.dart';
import 'package:hive_flutter/adapters.dart';

import '../../boxes.dart';

/*class FavouritePage extends StatefulWidget {
  late QueryDocumentSnapshot site;
  FavouritePage(this.site, {super.key});
  //final site;

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: _buildListView(),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return ValueListenableBuilder<Box<LocalFavourite>>(
        valueListenable: Boxes.getFavouritesBox().listenable(),
        builder: (context, box, _) {
          final siteBox = box.values.toList().cast<LocalFavourite>();
          return ListView.builder(
            itemCount: siteBox.length,
            itemBuilder: (BuildContext context, int index) {
              final site = siteBox[index];
              return Card(
                child: ListTile(
                  leading: Image.network(widget.site["Url_imagen"]),
                  title: Text(widget.site['Nombre'] ?? "No title"),
                  subtitle:
                      Text(widget.site['Descripción'] ?? "No description"),
                  onLongPress: () {
                    setState(() {
                      site.delete();
                    });
                  },
                ),
              );
            },
          );
        });
  }
}*/

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: _buildListView(),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return ValueListenableBuilder<Box<LocalFavourite>>(
        valueListenable: Boxes.getFavouritesBox().listenable(),
        builder: (context, box, _) {
          final siteBox = box.values.toList().cast<LocalFavourite>();
          return ListView.builder(
            itemCount: siteBox.length,
            itemBuilder: (BuildContext context, int index) {
              final site = siteBox[index];
              return Card(
                child: ListTile(
                  leading: Image.network(
                    site.Url_imagen ?? "",
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Image(
                        image: AssetImage('assets/images/logo.png'),
                      );
                    },
                  ),
                  title: Text(site.nombre ?? "No nombre"),
                  subtitle: Text('${site.ciudad}, ${site.departamento}'),
                  onLongPress: () {
                    setState(() {
                      site.delete();
                    });
                  },
                ),
              );
            },
          );
        });
  }
}
