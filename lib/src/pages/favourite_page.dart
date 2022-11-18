import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/local_favourite.dart';
import 'package:flutter_application_1/src/pages/list_page.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general_2.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general_3.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general_4.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general_5.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general_6.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general_7.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general_8.dart';
import 'package:flutter_application_1/src/pages/pages_POI/info_general_9.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_application_1/boxes.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text(
          'Favoritos',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
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
                  onTap: (() {
                    if (site.id == "2J5eXe2AqwKwn1MySQ4l") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InfoGeneral()));
                    } else if (site.id == "5EOcnGPN3JRNCzDFcFvV") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InfoGeneral4()));
                    } else if (site.id == "K0E8jWExGDdshLciBKZ4") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InfoGeneral7()));
                    } else if (site.id == "KmNI1frZl3OInsYvTK8g") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InfoGeneral9()));
                    } else if (site.id == "MmfFioc1xiEkKHJYndcD") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InfoGeneral8()));
                    } else if (site.id == "SdJDpel69B5IQQYmSJkj") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InfoGeneral5()));
                    } else if (site.id == "VihCCrCFZEu2VHzxtNpG") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InfoGeneral3()));
                    } else if (site.id == "kVueLTCk49yZaMXHWGvL") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InfoGeneral2()));
                    } else if (site.id == "vr6Jg76NHqtkddd70bS7") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InfoGeneral6()));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListPage()));
                    }
                  }),
                  leading: Image.network(
                    site.Url_imagen ?? "",
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Image(
                        image: AssetImage('assets/images/logo.png'),
                      );
                    },
                  ),
                  title: Text(site.nombre ?? "No title"),
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
