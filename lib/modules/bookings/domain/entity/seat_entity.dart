import 'package:equatable/equatable.dart';

enum CellType { seat, aisle, empty }

class SeatCellEntity extends Equatable {
  final CellType type;
  final String? id;
  final num? price;
  final bool isBooked;

  const SeatCellEntity({
    required this.type,
    this.id,
    this.price,
    this.isBooked = false,
  });

  @override
  List<Object?> get props => [type, id, price, isBooked];
}
