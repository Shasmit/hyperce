import 'dart:io';

import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import 'toast_widget.dart';

class BookingFooter extends StatelessWidget {
  final List<String> seats;
  final num totalPrice;
  final String currency;

  const BookingFooter({
    super.key,
    required this.seats,
    required this.totalPrice,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Platform.isIOS
          ? EdgeInsets.fromLTRB(16, 12, 16, 12)
          : EdgeInsets.fromLTRB(20, 16, 20, 16),
      decoration: BoxDecoration(
        color: Color(0xffEFE9E3),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            offset: const Offset(0, -2),
            color: Colors.black.withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    seats.isEmpty
                        ? "No seats selected"
                        : "Selected: ${seats.join(', ')}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Total: $currency $totalPrice",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 24,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
                backgroundColor: seats.isEmpty
                    ? Colors.grey.shade400
                    : Colors.white,
              ),
              onPressed: seats.isEmpty
                  ? null
                  : () {
                      final seatCount = seats.length;
                      CustomToast(context).show(
                        message: seatCount == 1
                            ? "Proceeding with 1 seat"
                            : "Proceeding with $seatCount seats",
                        type: ToastificationType.success,
                      );
                    },
              child: Text(
                "Continue",
                style: TextStyle(
                  color: seats.isEmpty
                      ? Colors.grey.shade600
                      : Colors.green.shade700,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
