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
      ..name = fields[1] as String?
      ..imageLink = fields[2] as String?
      ..description = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, LocalFavourite obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imageLink)
      ..writeByte(3)
      ..write(obj.description);
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
