// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_favourite.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalFavouriteAdapter extends TypeAdapter<LocalFavourite> {
  @override
  final int typeId = 0;

  @override
  LocalFavourite read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalFavourite()
      ..id = fields[0] as String?
      ..ciudad = fields[1] as String?
      ..departamento = fields[2] as String?
      ..description = fields[3] as String?
      ..nombre = fields[4] as String?
      ..Url_imagen = fields[5] as String?;
  }

  @override
  void write(BinaryWriter writer, LocalFavourite obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.ciudad)
      ..writeByte(2)
      ..write(obj.departamento)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.nombre)
      ..writeByte(5)
      ..write(obj.Url_imagen);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalFavouriteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
