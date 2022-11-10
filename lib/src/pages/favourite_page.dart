import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/local_favourite.dart';
import 'package:hive_flutter/adapters.dart';

import '../../boxes.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

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
          final placeBox = box.values.toList().cast<LocalFavourite>();
          return ListView.builder(
            itemCount: placeBox.length,
            itemBuilder: (BuildContext context, int index) {
              final place = placeBox[index];
              return Card(
                child: ListTile(
                  leading: Image.network(
                    place.imageLink ?? "",
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Image(
                        image: AssetImage('assets/images/logo.png'),
                      );
                    },
                  ),
                  title: Text(place.name ?? "No title"),
                  subtitle: Text(place.description ?? "No description"),
                  onLongPress: () {
                    setState(() {
                      place.delete();
                    });
                  },
                ),
              );
            },
          );
        });
  }
}
