// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeatCellModel _$SeatCellModelFromJson(Map<String, dynamic> json) =>
    SeatCellModel(
      type: json['type'] as String,
      id: json['id'] as String?,
      price: json['price'] as num?,
      isBooked: json['isBooked'] as bool?,
    );

Map<String, dynamic> _$SeatCellModelToJson(SeatCellModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'price': instance.price,
      'isBooked': instance.isBooked,
    };
