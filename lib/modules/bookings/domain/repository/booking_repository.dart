import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entity/vehicle_layout_entity.dart';

abstract class BookingRepository {
  Future<Either<Failure, VehicleLayoutEntity>> getVehicleLayout(
    String vehicleId,
  );
}
