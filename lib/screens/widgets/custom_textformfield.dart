import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CustomTextField extends StatelessWidget {
  final String name;
  final String labelText;
  final String hintText;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final int? maxLength;
  final int? maxLines;
  final double? borderRadius;

  const CustomTextField({
    super.key,
    required this.name,
    required this.labelText,
    required this.hintText,
    this.prefixIcon,
    this.keyboardType,
    this.validator,
    this.maxLength,
    this.maxLines,
    this.borderRadius = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: FormBuilderTextField(
        name: name,
        keyboardType: keyboardType,
        maxLength: maxLength,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: const EdgeInsets.only(
              top: 20.0, bottom: 0.0, left: 30.0, right: 10.0),
          hintStyle: const TextStyle(color: Colors.grey),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius!),
            ),
            borderSide: const BorderSide(
              color: Color(0xFFD1D1D1),
            ),
          ),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        ),
        validator: validator ?? FormBuilderValidators.required(),
      ),
    );
  }
}
