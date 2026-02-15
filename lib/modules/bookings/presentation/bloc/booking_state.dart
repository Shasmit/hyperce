part of 'booking_bloc.dart';

abstract class BookingState extends Equatable {
  const BookingState();
  @override
  List<Object?> get props => [];
}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingError extends BookingState {
  final String message;
  const BookingError(this.message);
  @override
  List<Object?> get props => [message];
}

class BookingLoaded extends BookingState {
  final VehicleLayoutEntity layout;
  final Set<String> selectedSeatIds;

  const BookingLoaded({required this.layout, required this.selectedSeatIds});

  num get totalPrice {
    num sum = 0;
    for (final row in layout.cells) {
      for (final cell in row) {
        if (cell.type == CellType.seat &&
            cell.id != null &&
            selectedSeatIds.contains(cell.id) &&
            cell.price != null) {
          sum += cell.price!;
        }
      }
    }
    return sum;
  }

  List<String> get selectedSeatNumbers => selectedSeatIds.toList()..sort();

  @override
  List<Object?> get props => [layout, selectedSeatIds];
}
