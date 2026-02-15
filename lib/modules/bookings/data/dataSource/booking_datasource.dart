import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ticket_booking/core/errors/exceptions.dart';

import '../../../../core/graphql/gql_queries.dart';
import '../model/vehicle_layout_model.dart';
import 'booking_datasource_impl.dart';

class BookingDataSourceImpl implements BookingDataSource {
  final GraphQLClient client;
  BookingDataSourceImpl({required this.client});

  @override
  Future<VehicleLayoutModel> getVehicleLayout(String vehicleId) async {
    final options = QueryOptions(
      document: gql(GqlQueries.getVehicleLayout),
      operationName: 'GetVehicleLayout',
      variables: {"vehicleId": vehicleId},
      fetchPolicy: FetchPolicy.noCache,
      cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
    );

    final result = await client.query(options);

    if (result.hasException) {
      throw AppServerException(result.exception.toString());
    }

    final data = result.data?["vehicleLayout"];
    if (data == null) throw AppServerException("No layout found");

    return VehicleLayoutModel.fromJson({
      "vehicleId": data["vehicleId"],
      "currency": data["currency"],
      "cells": (data["cells"] as List)
          .map(
            (row) =>
                (row as List).map((c) => Map<String, dynamic>.from(c)).toList(),
          )
          .toList(),
    });
  }
}
