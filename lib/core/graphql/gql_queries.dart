class GqlQueries {
  static const String getVehicleLayout = r'''
    query GetVehicleLayout($vehicleId: String!) {
      vehicleLayout(vehicleId: $vehicleId) {
        vehicleId
        currency
        cells
      }
    }
  ''';
}
