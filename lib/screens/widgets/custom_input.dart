import 'package:condo_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final IconData suffixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;

  const CustomInputField({
    Key? key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.labelText,
    this.hintText = '',
    this.obscureText = false,
    this.suffixIcon = Icons.visibility_rounded,
    this.isPassword = false,
    this.validator,
  }) : super(key: key);

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: const TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 6.0),
        Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
            side: BorderSide(
              color: Color(0xFFF1F1F1),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              controller: widget.controller,
              autocorrect: false,
              keyboardType: widget.keyboardType,
              obscureText: _obscureText,
              validator: widget.validator,
              decoration: InputDecoration(
                errorStyle: const TextStyle(
                    fontSize: 12.0, color: Color.fromARGB(255, 224, 107, 123)),
                hintText: widget.hintText,
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                suffixIcon: GestureDetector(
                    onTap: () {
                      if (widget.isPassword) {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      }
                    },
                    child: _obscureText
                        ? Icon(
                            !_obscureText
                                ? widget.suffixIcon
                                : Icons.visibility_off_rounded,
                            color: AppTheme.primaryLight,
                          )
                        : Icon(widget.suffixIcon,
                            color: AppTheme.primaryLight)),
              ),
            ),
          ),
        ),
        if (widget.validator != null) const SizedBox(height: 6.0),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
