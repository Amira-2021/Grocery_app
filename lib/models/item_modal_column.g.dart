// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_modal_column.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemModelColumnAdapter extends TypeAdapter<ItemModelColumn> {
  @override
  final int typeId = 0;

  @override
  ItemModelColumn read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemModelColumn(
      name: fields[1] as String,
      color: fields[2] as int?,
      price: fields[3] as String?,
      urlImage: fields[0] as String,
    )..isFavorite = fields[4] as bool;
  }

  @override
  void write(BinaryWriter writer, ItemModelColumn obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.urlImage)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.color)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemModelColumnAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
