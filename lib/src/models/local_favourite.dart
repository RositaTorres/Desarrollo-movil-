import 'package:hive/hive.dart';

part "local_favourite.g.dart";

@HiveType(typeId: 0)
class LocalFavourite extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? imageLink;

  @HiveField(3)
  String? description;
}
