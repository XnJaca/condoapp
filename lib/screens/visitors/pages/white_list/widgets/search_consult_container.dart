import 'package:condo_app/config/theme/app_theme.dart';
import 'package:condo_app/models/models.dart';
import 'package:condo_app/providers/providers.dart';
import 'package:condo_app/providers/white_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SearchConsultContainer extends StatelessWidget {
  const SearchConsultContainer({
    super.key,
    required GlobalKey<FormBuilderState> formKey,
    required this.casas,
    required this.loading,
    required this.ref,
    required this.whiteList,
  }) : _formKey = formKey;

  final GlobalKey<FormBuilderState> _formKey;
  final List<Finca> casas;
  final bool loading;
  final WidgetRef ref;
  final List<WhiteList?> whiteList;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Seleccione una casa"),
          const SizedBox(height: 20),
          FormBuilderDropdown(
            name: 'PropertyId',
            decoration: const InputDecoration(
              labelText: 'Casa a consultar',
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: loading
                  ? null
                  : () async {
                      if (_formKey.currentState!.saveAndValidate()) {
                        Map<String, dynamic> formData =
                            _formKey.currentState!.value;
                        ref.read(loadingProvider.notifier).state = true;
                        ref.read(whiteListReg.notifier).state = await ref
                            .read(whiteListProvider)
                            .getWhiteList(ref, formData['PropertyId']);
                        ref.read(loadingProvider.notifier).state = false;
                      }
                    },
              child: loading
                  ? const CircularProgressIndicator()
                  : const Text('Consultar'),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: whiteList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(whiteList[index]!.fullName),
                  subtitle: Text(whiteList[index]!.propertyId),
                );
              }),
        ],
      ),
    );
  }
}
