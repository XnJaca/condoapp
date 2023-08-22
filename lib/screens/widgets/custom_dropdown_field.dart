import 'package:condo_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TipoIdentificacionDropdown extends StatefulWidget {
  final ValueChanged<TipoIdentificacionOptions>? onChanged;

  const TipoIdentificacionDropdown({super.key, this.onChanged});

  @override
  TipoIdentificacionDropdownState createState() =>
      TipoIdentificacionDropdownState();
}

class TipoIdentificacionDropdownState
    extends State<TipoIdentificacionDropdown> {
  TipoIdentificacionOptions _selectedOption =
      tipoIdentificacionOptions[0]; // Inicializa con el primer valor
  int maxLength = 9; // Valor predeterminado

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: 'IndentificationType',
      builder: (FormFieldState<dynamic> field) {
        return InputDecorator(
          decoration: InputDecoration(
            labelText: "Tipo de Identificación",
            hintText: 'Seleccione un tipo de identificación',
            contentPadding: const EdgeInsets.only(
                top: 10.0, bottom: 0.0, left: 10.0, right: 10.0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
              borderSide: BorderSide(
                color: Color(0xFFD1D1D1),
              ),
            ),
            errorText: field.errorText,
          ),
          child: DropdownButton<TipoIdentificacionOptions>(
            isExpanded: true,
            value: _selectedOption,
            onChanged: (newValue) {
              setState(() {
                _selectedOption = newValue!;
                if (newValue.name == 'Cédula') {
                  maxLength = 9;
                } else if (newValue.name == 'Residencia') {
                  maxLength = 12;
                } else if (newValue.name == 'Pasaporte') {
                  maxLength = 5;
                }
                widget.onChanged?.call(newValue);
              });
            },
            hint: const Text('Seleccione un tipo de identificación'),
            items: tipoIdentificacionOptions
                .map((c) => DropdownMenuItem<TipoIdentificacionOptions>(
                      value: c,
                      child: Text(c.name),
                    ))
                .toList(),
            underline: Container(),
          ),
        );
      },
    );
  }
}
