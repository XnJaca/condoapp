import 'package:condo_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class FincaContainer extends StatelessWidget {
  const FincaContainer({
    super.key,
    required this.size,
    required this.logoUrl,
    required this.propertyNumber,
  });

  final Size size;
  final String logoUrl, propertyNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: size.width > 1000 ? 250 : 200,
          height: size.width > 1000
              ? 230
              : size.width > 600
                  ? 200
                  : 150,
          child: Container(
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(logoUrl),
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: size.width > 1000 ? 250 : 200,
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryLight.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      propertyNumber,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
