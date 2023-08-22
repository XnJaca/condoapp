import 'package:condo_app/config/generated/generated.dart';
import 'package:condo_app/config/router/app_router.dart';
import 'package:condo_app/config/theme/app_theme.dart';
import 'package:condo_app/models/models.dart';
import 'package:condo_app/screens/widgets/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends ConsumerState<RegisterScreen> {
  int maxLength = 9; // Longitud máxima inicial para cédula
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  TipoIdentificacionOptions? selectedOption;
  bool _isPasswordVisible = false;
  final bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/img/logoAppBar.png", width: 70),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        toolbarHeight: 80,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 145, 196, 156),
          ),
          onPressed: () {
            ref.read(appRouterProvider).go('/auth');
          },
        ),
      ),
      body: GestureDetector(
        onTap: () => {FocusScope.of(context).unfocus()},
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    'Registro',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: size.width * 0.7,
                    child: FormBuilder(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            width: size.width * 0.8,
                            child: Text(
                              AppLocalizations.of(context)
                                  .tittle_register_general,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const CustomDivider(),
                          const SizedBox(height: 10),
                          FormBuilderField(
                            name: 'tipoIdentificacion',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            builder: (FormFieldState<dynamic> field) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                  labelText: "Tipo de Identificación",
                                  hintText:
                                      'Seleccione un tipo de identificación',
                                  contentPadding: const EdgeInsets.only(
                                      top: 10.0, bottom: 0.0),
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
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: field.value,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 0.0),
                                  onChanged: (newValue) {
                                    field.didChange(newValue);

                                    if (newValue == 'Cédula') {
                                      setState(() {
                                        maxLength = 9;
                                      });
                                    } else if (newValue == 'Residencia') {
                                      setState(() {
                                        maxLength = 12;
                                      });
                                    } else if (newValue == 'Pasaporte') {
                                      setState(() {
                                        maxLength = 5;
                                      });
                                    }
                                  },
                                  hint: const Text(
                                      'Seleccione un tipo de identificación'),
                                  items: tipoIdentificacionOptions
                                      .map((c) => DropdownMenuItem<String>(
                                            value: c.name,
                                            child: Text(c.name),
                                          ))
                                      .toList(),
                                  // Configura el estilo del underline para ocultarlo
                                  underline: Container(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            name: 'numeroIdentificacion',
                            labelText: 'Numero de identificacion',
                            hintText: 'Digite su numero de identificacion.',
                            keyboardType: TextInputType.number,
                            prefixIcon: Icons.credit_card,
                            maxLength: maxLength,
                          ),
                          const CustomTextField(
                            name: 'nombre',
                            labelText: 'Nombre',
                            hintText: 'Ingrese su nombre.',
                            keyboardType: TextInputType.text,
                            prefixIcon: Icons.person,
                          ),
                          const CustomTextField(
                            name: 'primerApellido',
                            labelText: 'Primer Apellido',
                            hintText: 'Ingrese su primer apellido.',
                            keyboardType: TextInputType.text,
                            prefixIcon: Icons.person,
                          ),
                          const CustomTextField(
                            name: 'segundoApellido',
                            labelText: 'Segundo Apellido',
                            hintText: 'Ingrese su segundo apellido.',
                            keyboardType: TextInputType.text,
                            prefixIcon: Icons.person,
                          ),
                          const SizedBox(height: 10),
                          FormBuilderDateTimePicker(
                            name: 'fechaNacimiento',
                            initialValue: DateTime.now(),
                            decoration: const InputDecoration(
                              labelText: 'Fecha de Nacimiento',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50.0),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFD1D1D1),
                                ),
                              ),
                              prefixIcon: Icon(Icons.calendar_today),
                            ),
                            inputType: InputType.date,
                            // validators: [FormBuilderValidators.required()],
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: size.width * 0.8,
                            child: Text(
                              AppLocalizations.of(context)
                                  .tittle_register_general,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const CustomDivider(),
                          const SizedBox(height: 10),
                          const CustomTextField(
                            name: 'numeroTelefono',
                            labelText: 'Numero de Telefono',
                            hintText: 'Digite su numero de telefono.',
                            keyboardType: TextInputType.phone,
                            prefixIcon: Icons.phone,
                          ),
                          const CustomTextField(
                            name: 'email',
                            labelText: 'Email',
                            hintText: 'Digite su correo electronico.',
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: Icons.email,
                          ),
                          FormBuilderTextField(
                            name: 'password',
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                              hintStyle: const TextStyle(color: Colors.grey),
                              hintText: 'Digite su contraseña.',
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
                                icon: Icon(_isPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons
                                        .visibility), // Cambia el ícono en función del estado
                                onPressed: () {
                                  _isPasswordVisible = !_isPasswordVisible;
                                  setState(() {});
                                },
                              ),
                            ),
                            obscureText: !_isPasswordVisible,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            obscuringCharacter: "•",
                            autocorrect: false,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FormBuilderTextField(
                            name: 'confirmPassword',
                            decoration: InputDecoration(
                              labelText: 'Confirmar Contraseña',
                              hintStyle: const TextStyle(color: Colors.grey),
                              hintText: 'Digite su contraseña.',
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
                                icon: Icon(_isConfirmPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  _isPasswordVisible = !_isPasswordVisible;
                                  setState(() {});
                                },
                              ),
                            ),
                            obscureText: !_isPasswordVisible,
                            validator: (value) {
                              // Validar que la contraseña coincida con la confirmación
                              if (value !=
                                  _formKey.currentState!.value['password']) {
                                return 'Las contraseñas no coinciden';
                              }
                              return null;
                            },
                            obscuringCharacter: "•",
                            autocorrect: false,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(size.width * 0.3, 50),
                              backgroundColor: AppTheme.primaryLight,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.saveAndValidate()) {
                                // Los datos del formulario son válidos, puedes enviarlos aquí
                                Map<String, dynamic> formData =
                                    _formKey.currentState!.value;
                                // Luego puedes enviar formData a donde necesites
                              }
                            },
                            child: const Text(
                              'Registrarse',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color.fromARGB(255, 145, 196, 156),
      height: 20,
      thickness: 1,
      indent: 20,
      endIndent: 25,
    );
  }
}
