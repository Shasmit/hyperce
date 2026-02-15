import '../model/vehicle_layout_model.dart';

abstract class BookingDataSource {
  Future<VehicleLayoutModel> getVehicleLayout(String vehicleId);
}
