// ignore_for_file: unrelated_type_equality_checks

import 'package:condo_app/config/theme/app_theme.dart';
import 'package:condo_app/models/models.dart';
import 'package:condo_app/providers/user_provider.dart';
import 'package:condo_app/screens/screens.dart';
import 'package:condo_app/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickalert/quickalert.dart';

class UserInformationContainer extends ConsumerStatefulWidget {
  const UserInformationContainer({super.key});

  @override
  UserInformationContainerState createState() =>
      UserInformationContainerState();
}

class UserInformationContainerState
    extends ConsumerState<UserInformationContainer> {
  int maxLength = 9;
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  String confirmedPassword = '';

  @override
  Widget build(BuildContext context) {
    final Person? userData = ref.watch(userProvider);

    final size = MediaQuery.of(context).size;

    final isLoading = ref.watch(loadingProvider);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: size.width * 0.7,
            child: FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              initialValue: {
                'IndentificationType': userData!.indentificationType,
                'Indentification': userData.indentification,
                'Firstname': userData.firstname,
                'Lastname1': userData.lastname1,
                'Lastname2': userData.lastname2,
                'BirthDate': userData.birthDate,
                'Telephone': userData.telephone,
                'Email': userData.email,
                'Password': '',
              },
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Información personal',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TipoIdentificacionDropdown(
                    onChanged: (newValue) {
                      setState(() {
                        if (newValue == 'Cédula') {
                          maxLength = 9;
                        } else if (newValue == 'Residencia') {
                          maxLength = 12;
                        } else if (newValue == 'Pasaporte') {
                          maxLength = 5;
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    name: 'Indentification',
                    labelText: 'Identificación',
                    hintText: 'Ingrese su identificación',
                    keyboardType: TextInputType.number,
                    maxLength: maxLength,
                    prefixIcon: Icons.badge_rounded,
                  ),
                  const CustomTextField(
                    name: 'Firstname',
                    labelText: 'Nombre',
                    hintText: 'Ingrese su nombre',
                    prefixIcon: Icons.person,
                  ),
                  const CustomTextField(
                    name: 'Lastname1',
                    labelText: 'Primer apellido',
                    hintText: 'Ingrese su primer apellido',
                    prefixIcon: Icons.person,
                  ),
                  const CustomTextField(
                    name: 'Lastname2',
                    labelText: 'Segundo apellido',
                    hintText: 'Ingrese su segundo apellido',
                    prefixIcon: Icons.person,
                  ),
                  FormBuilderDateTimePicker(
                    name: 'BirthDate',
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
                  const Text(
                    'Información de Contacto',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const CustomTextField(
                    name: 'Telephone',
                    labelText: 'Número de teléfono',
                    hintText: 'Ingrese su número de teléfono',
                    keyboardType: TextInputType.number,
                    maxLength: 8,
                    prefixIcon: Icons.phone,
                  ),
                  const CustomTextField(
                    name: 'Email',
                    labelText: 'Correo electrónico',
                    hintText: 'Ingrese su correo electrónico',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(size.width * 1, 50),
                      backgroundColor: AppTheme.primaryLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                    ),
                    onPressed: isLoading
                        ? null
                        : () async {
                            ref.read(loadingProvider.notifier).state = true;

                            if (_formKey.currentState!.saveAndValidate()) {
                              Map<String, dynamic> formData =
                                  _formKey.currentState!.value;

                              // Verificar si tanto password como confirm password están vacíos
                              // if (formData['password'] == '' &&
                              //     formData['confirmPassword'] == '') {
                              //   // Asignar la contraseña del userData.password
                              //   formData['password'] = userData.password;
                              //   formData['confirmPassword'] = userData.password;
                              // }

                              Map<String, dynamic> updatedData = {
                                'Id': userData.id,
                                'Role': userData.role,
                                'Password': userData.password,
                                'CreatedAt': userData.createdAt,
                                'BirthDate': formData['BirthDate'].toString(),
                                'UpdatedAt': DateTime(
                                  DateTime.now().year,
                                  DateTime.now().month,
                                  DateTime.now().day,
                                  DateTime.now().hour,
                                  DateTime.now().minute,
                                  DateTime.now().second,
                                ).toString(),
                              };

                              // Combinar los mapas originales y los datos actualizados
                              Map<String, dynamic> combinedData = {
                                ...formData,
                                ...updatedData
                              };

                              try {
                                Person? person =
                                    ref.read(userProvider.notifier).state =
                                        await ref
                                            .read(authProvider)
                                            .saveDataUser(ref, combinedData);

                                await SecureStorage.writeUser(person!);

                                // ignore: unused_result
                                ref.read(userProvider.notifier).state = person;

                                // ignore: use_build_context_synchronously
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.success,
                                  width: 300,
                                  title: 'Datos guardados',
                                  text:
                                      'Los datos se han guardado correctamente.',
                                );
                                ref.read(loadingProvider.notifier).state =
                                    false;
                              } catch (e) {
                                // print(e);
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.warning,
                                  width: 200,
                                  title: 'Error',
                                  text:
                                      'Error al guardar los datos, intente de nuevo, dentro de unos minutos',
                                );
                              }
                            }
                          },
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: AppTheme.primaryLight,
                          )
                        : const Text(
                            'Guardar',
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
        ),
      ),
    );
  }
}
