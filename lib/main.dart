import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_booking/modules/bookings/presentation/view/splash_view.dart';

import 'core/di/injection_container.dart' as di;
import 'core/di/injection_container.dart';
import 'modules/bookings/presentation/bloc/booking_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<BookingBloc>(create: (_) => sl<BookingBloc>())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ticket Booking',
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(centerTitle: true),
        ),
        home: SplashView(),
      ),
    );
  }
}
