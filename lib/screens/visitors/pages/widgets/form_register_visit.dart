import 'package:condo_app/config/theme/app_theme.dart';
import 'package:condo_app/models/models.dart';
import 'package:condo_app/providers/providers.dart';
import 'package:condo_app/providers/visitors_provider.dart';
import 'package:condo_app/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';

class FormVisit extends ConsumerStatefulWidget {
  const FormVisit({
    super.key,
  });

  @override
  FormVisitState createState() => FormVisitState();
}

class FormVisitState extends ConsumerState<FormVisit> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Finca>> casas = ref.read(fincasListProvider);
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Registrar Visita',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          FormBuilder(
            key: _formKey,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        name: 'NameVisitor',
                        labelText: 'Nombre del Visitante',
                        hintText: 'Nombre del Visitante',
                        prefixIcon: Icons.person,
                        validator: FormBuilderValidators.required(),
                      ),
                      CustomTextField(
                        name: 'Description',
                        labelText: 'Descripción',
                        hintText: 'Descripción',
                        prefixIcon: Icons.description,
                        validator: FormBuilderValidators.required(),
                        maxLines: 2,
                        borderRadius: 20,
                      ),
                      FormBuilderDateTimePicker(
                        name: 'DateVisit',
                        initialValue: DateTime.now(),
                        decoration: const InputDecoration(
                          labelText: 'Fecha y Hora de Visita',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFFD1D1D1),
                            ),
                          ),
                          prefixIcon: Icon(Icons.calendar_today),
                        ),
                        inputType: InputType.both,
                        format: DateFormat(
                            'dd/MM/yyyy HH:mm'), // Cambiado el formato para incluir la hora
                        timePickerInitialEntryMode: TimePickerEntryMode.input,
                        // validators: [FormBuilderValidators.required()],
                      ),
                      const SizedBox(height: 10),
                      FormBuilderDropdown(
                        name: 'PropertyId',
                        decoration: const InputDecoration(
                          labelText: 'Casa a visitar',
                          hintText: 'Seleccione la casa a visitar',
                          contentPadding: EdgeInsets.only(
                              top: 20.0, bottom: 0.0, left: 30.0, right: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFFD1D1D1),
                            ),
                          ),
                        ),
                        items: casas.when(
                          data: (fincas) {
                            return fincas.map((finca) {
                              return DropdownMenuItem(
                                value: finca.id,
                                child: Text(finca.propertyNumber!),
                              );
                            }).toList();
                          },
                          loading: () => [
                            const DropdownMenuItem(
                                value: null, child: Text('Cargando...'))
                          ],
                          error: (error, stackTrace) => [
                            const DropdownMenuItem(
                                value: null, child: Text('Error al cargar'))
                          ],
                        ),
                        validator: FormBuilderValidators.required(),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryLight,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                          ),
                          onPressed: () async {
                            final user = ref.read(userProvider);
                            if (_formKey.currentState!.validate()) {
                              // final DateFormat formatter =
                              //     DateFormat('dd/MM/yyyy HH:MM a');
                              final Map<String, dynamic> data = {
                                "NameVisitor": _formKey
                                    .currentState!.fields['NameVisitor']!.value,
                                "Description": _formKey
                                    .currentState!.fields['Description']!.value,
                                "DateVisit": formatDateTime(_formKey
                                    .currentState!.fields['DateVisit']!.value),
                                "PropertyId": _formKey
                                    .currentState!.fields['PropertyId']!.value,
                                "TypeIdentification": user!.indentificationType,
                                "Identification": user.indentification,
                                "UserId": user.id,
                              };

                              try {
                                Visitor? visitor = await ref
                                    .read(visitorsProvider)
                                    .saveVisitor(ref, data);

                                if (visitor != null) {
                                  ref.read(visitorListProvider.notifier).state =
                                      await ref
                                          .read(visitorsProvider)
                                          .getVisitors(ref);
                                }
                              } catch (e) {
                                QuickAlert.show(
                                  context: context,
                                  title: 'Error',
                                  text: 'Error al guardar la visita $e',
                                  type: QuickAlertType.error,
                                );
                                print(e);
                              }
                            }
                          },
                          child: const Text('Guardar Visita'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String formatDateTime(DateTime dateTime) {
    String formattedDate = DateFormat('dd/MM/yyyy hh:mm').format(dateTime);

    int hour = dateTime.hour;

    // Determine whether to add "AM", "PM" or "MD"
    String period = hour == 12 ? 'MD' : (hour >= 12 ? 'PM' : 'AM');

    return '$formattedDate $period';
  }
}
