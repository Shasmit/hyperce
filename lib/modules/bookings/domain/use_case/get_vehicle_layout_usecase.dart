import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entity/vehicle_layout_entity.dart';
import '../repository/booking_repository.dart';

class GetVehicleLayoutUsecase {
  final BookingRepository repository;
  GetVehicleLayoutUsecase({required this.repository});

  Future<Either<Failure, VehicleLayoutEntity>> call(String vehicleId) {
    return repository.getVehicleLayout(vehicleId);
  }
}
