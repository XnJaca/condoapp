import 'package:condo_app/config/theme/app_theme.dart';
import 'package:condo_app/models/models.dart';
import 'package:flutter/material.dart';

class InfoFincaPopUp extends StatelessWidget {
  const InfoFincaPopUp({
    super.key,
    required this.size,
    required this.finca,
  });

  final Size size;
  final Finca finca;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Container(
                width: size.width * 0.2,
                height: size.height *
                    0.15, // Ajusta la proporción de altura según tus necesidades
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(finca.condominium!.logoUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                finca.propertyNumber!,
                style: TextStyle(
                  fontSize: size.width *
                      0.04, // Ajusta el factor multiplicativo según tus necesidades
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryLight,
                ),
              ),
              Text(
                finca.condominium!.nameCondominium!,
                style: TextStyle(
                  fontSize: size.width *
                      0.03, // Ajusta el factor multiplicativo según tus necesidades
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    finca.habitants.toString(),
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryLight),
                  ),
                  const Text(
                    "Habitaciones",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    finca.rented! ? 'Si' : 'No',
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryLight,
                    ),
                  ),
                  const Text(
                    "Alquilada",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
