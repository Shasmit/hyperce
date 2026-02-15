// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_layout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleLayoutModel _$VehicleLayoutModelFromJson(Map<String, dynamic> json) =>
    VehicleLayoutModel(
      vehicleId: json['vehicleId'] as String,
      currency: json['currency'] as String,
      cells: (json['cells'] as List<dynamic>)
          .map(
            (e) => (e as List<dynamic>)
                .map((e) => SeatCellModel.fromJson(e as Map<String, dynamic>))
                .toList(),
          )
          .toList(),
    );

Map<String, dynamic> _$VehicleLayoutModelToJson(VehicleLayoutModel instance) =>
    <String, dynamic>{
      'vehicleId': instance.vehicleId,
      'currency': instance.currency,
      'cells': instance.cells
          .map((e) => e.map((e) => e.toJson()).toList())
          .toList(),
    };
