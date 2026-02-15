import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class LocalMockLink extends Link {
  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    // Only handle our query
    final isLayoutQuery =
        request.operation.operationName == 'GetVehicleLayout' ||
        request.operation.document.toString().contains('vehicleLayout');

    if (!isLayoutQuery) {
      yield Response(
        response: {},
        errors: [GraphQLError(message: 'Unknown operation')],
        data: null,
      );
      return;
    }

    try {
      final raw = await rootBundle.loadString(
        'assets/mock/vehicle_layout.json',
      );
      final jsonMap = jsonDecode(raw) as Map<String, dynamic>;

      yield Response(
        response: const {},
        data: {
          "vehicleLayout": {
            "__typename": "VehicleLayout", // ✅ ADD THIS
            "vehicleId": jsonMap["vehicleId"],
            "currency": jsonMap["currency"],
            "cells": jsonMap["cells"],
          },
        },
      );
    } catch (e) {
      yield Response(
        response: const {},
        errors: [GraphQLError(message: e.toString())],
        data: null,
      );
    }
  }
}
