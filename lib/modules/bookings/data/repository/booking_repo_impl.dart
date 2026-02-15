import 'package:dartz/dartz.dart';
import 'package:ticket_booking/core/errors/exceptions.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entity/seat_entity.dart';
import '../../domain/entity/vehicle_layout_entity.dart';
import '../../domain/repository/booking_repository.dart';
import '../dataSource/booking_datasource_impl.dart';
import '../model/seat_model.dart';

class BookingRepoImpl implements BookingRepository {
  final BookingDataSource dataSource;
  BookingRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, VehicleLayoutEntity>> getVehicleLayout(
    String vehicleId,
  ) async {
    try {
      final model = await dataSource.getVehicleLayout(vehicleId);

      final entity = VehicleLayoutEntity(
        vehicleId: model.vehicleId,
        currency: model.currency,
        cells: model.cells.map(_mapRow).toList(),
      );

      return Right(entity);
    } on AppServerException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  List<SeatCellEntity> _mapRow(List<SeatCellModel> row) {
    return row.map((c) {
      final type = switch (c.type) {
        "seat" => CellType.seat,
        "aisle" => CellType.aisle,
        _ => CellType.empty,
      };
      return SeatCellEntity(
        type: type,
        id: c.id,
        price: c.price,
        isBooked: c.isBooked ?? false,
      );
    }).toList();
  }
}
