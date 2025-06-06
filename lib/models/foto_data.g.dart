// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foto_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FotoDataAdapter extends TypeAdapter<FotoData> {
  @override
  final int typeId = 0;

  @override
  FotoData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FotoData(
      fotoId: fields[0] as String,
      base64: fields[1] as String?,
      url: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FotoData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.fotoId)
      ..writeByte(1)
      ..write(obj.base64)
      ..writeByte(2)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FotoDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
