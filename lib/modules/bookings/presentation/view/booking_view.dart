import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/booking_bloc.dart';
import '../widget/booking_footer.dart';
import '../widget/seat_tile.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  void initState() {
    super.initState();
    context.read<BookingBloc>().add(
      const FetchVehicleLayoutEvent("Sajha A/C Sofa Seater"),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Color(0xffEFE9E3),
      appBar: AppBar(
        title: const Text("Select Seats"),
        elevation: 0,
        backgroundColor: Color(0xffEFE9E3),
        surfaceTintColor: Color(0xffEFE9E3),
      ),
      body: BlocBuilder<BookingBloc, BookingState>(
        builder: (context, state) {
          if (state is BookingLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is BookingError) {
            return Center(child: Text(state.message));
          }
          if (state is BookingLoaded) {
            final layout = state.layout;

            return Stack(
              children: [
                ListView(
                  padding: EdgeInsets.fromLTRB(
                    size.width * 0.04,
                    Platform.isIOS ? size.height * 0.01 : size.height * 0.02,
                    size.width * 0.04,
                    size.height * 0.12,
                  ),
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  "assets/icons/bus.jpg",
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: size.width * 0.02),
                              Text(
                                layout.vehicleId,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Image.asset(
                                    "assets/icons/wheel.png",
                                    width: 55,
                                    height: 55,
                                    color: Colors.grey.shade700,
                                  ),
                                  Text('Driver'),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Platform.isIOS
                                ? size.height * 0.02
                                : size.height * 0.04,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(layout.cells.length, (r) {
                              final row = layout.cells[r];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  spacing: 16,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(row.length, (c) {
                                    final cell = row[c];
                                    final selected =
                                        cell.id != null &&
                                        state.selectedSeatIds.contains(cell.id);

                                    return SeatTile(
                                      cell: cell,
                                      isSelected: selected,
                                      onTap: cell.id == null
                                          ? null
                                          : () => context
                                                .read<BookingBloc>()
                                                .add(ToggleSeatEvent(cell.id!)),
                                    );
                                  }),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Platform.isIOS
                          ? size.height * 0.02
                          : size.height * 0.04,
                    ),
                    _statusContainer(),
                  ],
                ),

                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: BookingFooter(
                    seats: state.selectedSeatNumbers,
                    totalPrice: state.totalPrice,
                    currency: layout.currency,
                  ),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _statusContainer() {
    Widget chip(Color color, String label) => Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          chip(Colors.grey.shade200, "Available"),
          chip(Colors.green.shade500, "Selected"),
          chip(Colors.red.shade400, "Booked"),
        ],
      ),
    );
  }
}
