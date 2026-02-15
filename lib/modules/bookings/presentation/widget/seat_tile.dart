import 'package:flutter/material.dart';

import '../../domain/entity/seat_entity.dart';

class SeatTile extends StatelessWidget {
  final SeatCellEntity cell;
  final bool isSelected;
  final VoidCallback? onTap;

  const SeatTile({
    super.key,
    required this.cell,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (cell.type == CellType.aisle) {
      return const SizedBox(width: 12, height: 42);
    }
    if (cell.type == CellType.empty) {
      return const SizedBox(width: 42, height: 42);
    }

    final booked = cell.isBooked;
    final bg = booked
        ? Colors.red.shade400
        : isSelected
        ? Colors.green.shade500
        : Colors.grey.shade200;

    final border = booked ? Colors.red.shade700 : Colors.grey.shade400;
    final textColor = booked
        ? Colors.red.shade700
        : isSelected
        ? Colors.green.shade700
        : Colors.grey.shade700;

    return GestureDetector(
      onTap: booked ? null : onTap,
      child: Column(
        children: [
          Container(
            width: 42,
            height: 42,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: bg,
              border: Border.all(color: border),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/seat.png",
                      width: 14,
                      height: 14,
                      color: booked || isSelected
                          ? Colors.white
                          : Colors.black54,
                    ),
                    Text(
                      (cell.id ?? "").replaceAll(RegExp(r'[^0-9A-Za-z]'), ''),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: booked || isSelected
                            ? Colors.white
                            : Colors.black87,
                      ),
                    ),
                  ],
                ),
                if (booked)
                  Positioned(
                    bottom: 12,
                    child: Container(width: 30, height: 2, color: Colors.white),
                  ),
              ],
            ),
          ),
          if (cell.price != null)
            Text(
              "रु.${cell.price}",
              style: TextStyle(fontSize: 10, color: textColor),
            ),
        ],
      ),
    );
  }
}
