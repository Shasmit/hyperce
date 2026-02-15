import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/seat_entity.dart';
import '../../domain/entity/vehicle_layout_entity.dart';
import '../../domain/use_case/get_vehicle_layout_usecase.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final GetVehicleLayoutUsecase getVehicleLayoutUsecase;

  BookingBloc({required this.getVehicleLayoutUsecase})
    : super(BookingInitial()) {
    on<FetchVehicleLayoutEvent>(_onFetchLayout);
    on<ToggleSeatEvent>(_onToggleSeat);
  }

  Future<void> _onFetchLayout(
    FetchVehicleLayoutEvent event,
    Emitter<BookingState> emit,
  ) async {
    emit(BookingLoading());
    final result = await getVehicleLayoutUsecase(event.vehicleId);
    result.fold(
      (failure) => emit(BookingError(failure.error)),
      (layout) =>
          emit(BookingLoaded(layout: layout, selectedSeatIds: <String>{})),
    );
  }

  void _onToggleSeat(ToggleSeatEvent event, Emitter<BookingState> emit) {
    final current = state;
    if (current is! BookingLoaded) return;

    final seat = _findSeat(current.layout, event.seatId);
    if (seat == null) return;
    if (seat.isBooked) return;

    final next = Set<String>.from(current.selectedSeatIds);
    if (next.contains(event.seatId)) {
      next.remove(event.seatId);
    } else {
      next.add(event.seatId);
    }

    emit(BookingLoaded(layout: current.layout, selectedSeatIds: next));
  }

  SeatCellEntity? _findSeat(VehicleLayoutEntity layout, String seatId) {
    for (final row in layout.cells) {
      for (final cell in row) {
        if (cell.type == CellType.seat && cell.id == seatId) return cell;
      }
    }
    return null;
  }
}
