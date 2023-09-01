import 'package:condo_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text("Reservacion de areas comunes.",
              style: TextStyle(
                fontSize: 16,
              ))
        ],
      ),
    );
  }
}
