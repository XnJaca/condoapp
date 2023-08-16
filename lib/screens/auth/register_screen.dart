import 'package:condo_app/models/models.dart';
import 'package:flutter/cupertino.dart';
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
  final TextEditingController identificacionController =
      TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController primerApellidoController =
      TextEditingController();
  final TextEditingController segundoApellidoController =
      TextEditingController();
  final TextEditingController fechaNacimientoController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    TipoIdentificacionOptions? selectedOption;

    final _formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/img/logo.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormBuilderField(
                        name: "name",
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        builder: (FormFieldState<dynamic> field) {
                          return InputDecorator(
                            decoration: InputDecoration(
                              labelText: "Select option",
                              // contentPadding:
                              //     const EdgeInsets.only(top: 10.0, bottom: 0.0),
                              border: InputBorder.none,
                              errorText: field.errorText,
                            ),
                            child: SizedBox(
                              height: 200,
                              child: CupertinoPicker(
                                itemExtent: 30,
                                children: tipoIdentificacionOptions
                                    .map((c) => Text(c.name))
                                    .toList(),
                                onSelectedItemChanged: (index) {
                                  field.didChange(
                                      tipoIdentificacionOptions[index]);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      FormBuilderTextField(
                        name: 'email',
                        decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            )),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                      ),
                      const SizedBox(height: 10),
                      FormBuilderTextField(
                        name: 'password',
                        decoration:
                            const InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      MaterialButton(
                        color: Theme.of(context).colorScheme.secondary,
                        onPressed: () {
                          // Validate and save the form values
                          _formKey.currentState?.saveAndValidate();
                          debugPrint(_formKey.currentState?.value.toString());

                          // On another side, can access all field values without saving form with instantValues
                          _formKey.currentState?.validate();
                          debugPrint(
                              _formKey.currentState?.instantValue.toString());
                        },
                        child: const Text('Login'),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
