import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomPasswordField extends StatefulWidget {
  final String name;
  final String labelText;
  final String hintText;
  final FormFieldValidator<String>? validator;

  const CustomPasswordField({
    required this.name,
    required this.labelText,
    required this.hintText,
    this.validator,
  });

  @override
  CustomPasswordFieldState createState() => CustomPasswordFieldState();
}

class CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintStyle: const TextStyle(color: Colors.grey),
        hintText: widget.hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
          borderSide: BorderSide(
            color: Color(0xFFD1D1D1),
          ),
        ),
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
      obscureText: !_isPasswordVisible,
      validator: widget.validator,
      obscuringCharacter: "•",
      autocorrect: false,
    );
  }
}
