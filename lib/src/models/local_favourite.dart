import 'package:hive/hive.dart';

part "local_favourite.g.dart";

@HiveType(typeId: 0)
class LocalFavourite extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? ciudad;

  @HiveField(2)
  String? departamento;

  @HiveField(3)
  String? description;

  @HiveField(4)
  String? nombre;

  @HiveField(5)
  String? Url_imagen;
}
