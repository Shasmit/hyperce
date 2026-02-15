import 'package:json_annotation/json_annotation.dart';

part 'seat_model.g.dart';

@JsonSerializable()
class SeatCellModel {
  final String type;
  final String? id;
  final num? price;
  final bool? isBooked;

  const SeatCellModel({required this.type, this.id, this.price, this.isBooked});

  factory SeatCellModel.fromJson(Map<String, dynamic> json) =>
      _$SeatCellModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeatCellModelToJson(this);
}
