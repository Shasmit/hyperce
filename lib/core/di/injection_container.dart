import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../modules/bookings/data/dataSource/booking_datasource.dart';
import '../../modules/bookings/data/dataSource/booking_datasource_impl.dart';
import '../../modules/bookings/data/repository/booking_repo_impl.dart';
import '../../modules/bookings/domain/repository/booking_repository.dart';
import '../../modules/bookings/domain/use_case/get_vehicle_layout_usecase.dart';
import '../../modules/bookings/presentation/bloc/booking_bloc.dart';
import '../graphql/local_mock_link.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  injectCore();
  injectBooking();
}

void injectCore() {
  // GraphQL client (Mock Local Link)
  sl.registerLazySingleton<GraphQLClient>(() {
    final link = LocalMockLink();
    return GraphQLClient(
      link: link,
      cache: GraphQLCache(store: InMemoryStore()),
    );
  });
}

void injectBooking() {
  // bloc
  sl.registerFactory<BookingBloc>(
    () => BookingBloc(getVehicleLayoutUsecase: sl()),
  );

  // dataSource
  sl.registerLazySingleton<BookingDataSource>(
    () => BookingDataSourceImpl(client: sl()),
  );

  // repository
  sl.registerLazySingleton<BookingRepository>(
    () => BookingRepoImpl(dataSource: sl()),
  );

  // use case
  sl.registerLazySingleton<GetVehicleLayoutUsecase>(
    () => GetVehicleLayoutUsecase(repository: sl()),
  );
}
