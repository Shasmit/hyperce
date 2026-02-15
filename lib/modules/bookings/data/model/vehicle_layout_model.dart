import 'package:json_annotation/json_annotation.dart';

import 'seat_model.dart';

part 'vehicle_layout_model.g.dart';

@JsonSerializable(explicitToJson: true)
class VehicleLayoutModel {
  final String vehicleId;
  final String currency;
  final List<List<SeatCellModel>> cells;

  const VehicleLayoutModel({
    required this.vehicleId,
    required this.currency,
    required this.cells,
  });

  factory VehicleLayoutModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleLayoutModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleLayoutModelToJson(this);
}
