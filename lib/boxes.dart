import 'package:flutter_application_1/src/models/local_favourite.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<LocalFavourite> getFavouritesBox() =>
      Hive.box<LocalFavourite>('favourites');
}
