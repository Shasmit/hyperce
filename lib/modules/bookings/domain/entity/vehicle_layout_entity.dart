import 'package:equatable/equatable.dart';

import 'seat_entity.dart';

class VehicleLayoutEntity extends Equatable {
  final String vehicleId;
  final String currency;
  final List<List<SeatCellEntity>> cells;

  const VehicleLayoutEntity({
    required this.vehicleId,
    required this.currency,
    required this.cells,
  });

  @override
  List<Object?> get props => [vehicleId, currency, cells];
}
