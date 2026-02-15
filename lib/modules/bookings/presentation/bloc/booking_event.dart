part of 'booking_bloc.dart';

abstract class BookingEvent extends Equatable {
  const BookingEvent();
  @override
  List<Object?> get props => [];
}

class FetchVehicleLayoutEvent extends BookingEvent {
  final String vehicleId;
  const FetchVehicleLayoutEvent(this.vehicleId);

  @override
  List<Object?> get props => [vehicleId];
}

class ToggleSeatEvent extends BookingEvent {
  final String seatId;
  const ToggleSeatEvent(this.seatId);

  @override
  List<Object?> get props => [seatId];
}
