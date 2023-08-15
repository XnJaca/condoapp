import 'package:flutter/material.dart';

class CustomLabelText extends StatelessWidget {
  const CustomLabelText({
    super.key,
    required this.texto,
    this.fontWeight = FontWeight.normal,
  });

  final String texto;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 7),
      // alignment: AlignmentDirectional.topStart,
      child: Text(
        texto,
        style: TextStyle(
          fontFamily: "Nunito",
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
