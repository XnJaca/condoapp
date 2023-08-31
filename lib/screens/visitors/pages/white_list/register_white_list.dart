import 'package:condo_app/config/theme/app_theme.dart';
import 'package:condo_app/models/models.dart';
import 'package:condo_app/providers/providers.dart';
import 'package:condo_app/providers/white_list_provider.dart';
import 'package:condo_app/screens/visitors/pages/widgets/widgets.dart';
import 'package:condo_app/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RegisterWhiteList extends ConsumerStatefulWidget {
  static const name = "RegisterWhiteList";
  const RegisterWhiteList({super.key});

  @override
  _RegisterWhiteListState createState() => _RegisterWhiteListState();
}

class _RegisterWhiteListState extends ConsumerState<RegisterWhiteList> {
  int maxLength = 9;

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final List<Finca> casas = ref.watch(fincasListProvider).when(
          data: (fincas) => fincas,
          loading: () => [],
          error: (error, stackTrace) => [],
        );
    final List<WhiteList?> whiteList = ref.watch(whiteListReg);

    final loading = ref.watch(loadingProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar lista blanca',
            style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: Container(
            width: size.width < 600 ? size.width * 0.9 : size.width * 0.6,
            margin: const EdgeInsets.only(top: 20),
            child: FormBuilder(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  CustomTextField(
                    name: 'Identification',
                    labelText: 'Identificacion',
                    hintText: 'Ingrese su numero de identificacion.',
                    maxLength: maxLength,
                  ),
                  const CustomTextField(
                      name: 'FullName',
                      labelText: 'Nombre del Visitante',
                      hintText: 'Ingrese el nombre del visitante'),
                  const CustomTextField(
                      name: 'Description',
                      labelText: 'Descripcion de la Visita',
                      hintText: 'Ingrese la descripcion de la visita',
                      maxLines: 3),
                  FormBuilderSwitch(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(
                          top: 0.0, bottom: 10.0, left: 30.0, right: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xFFD1D1D1),
                        ),
                      ),
                    ),
                    name: 'proveedor',
                    title: const Text('Proveedor: '),
                  ),
                  const SizedBox(height: 20),

                  const CustomTextField(
                      name: 'Plate',
                      labelText: 'Licencia del Vehiculo',
                      hintText: 'Ingrese la licencia del vehiculo.'),
                  const SizedBox(height: 20),

                  FormBuilderDropdown(
                    name: 'PropertyId',
                    decoration: const InputDecoration(
                      labelText: 'Casa a visitar',
                      hintText: 'Seleccione una casa...',
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
                    items: casas.map((finca) {
                      return DropdownMenuItem(
                        value: finca.id,
                        child: Text(finca.propertyNumber!),
                      );
                    }).toList(),
                    validator: FormBuilderValidators.required(),
                  ),

                  //save button
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppTheme.primaryLight,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.saveAndValidate()) {

                          //add to white list
                          
                          // ref.read(whiteListReg.notifier).state = [];
                          // ref
                          //     .read(whiteListReg.notifier)
                          //     .addWhiteList(_formKey.currentState!.value);
                          // ref.read(loadingProvider.notifier).state = true;
                          // ref
                          //     .read(whiteListReg.notifier)
                          //     .getWhiteList(_formKey.currentState!.value);
                          // ref.read(loadingProvider.notifier).state = false;
                          // Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        'Guardar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
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
