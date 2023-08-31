import 'package:condo_app/config/router/app_router.dart';
import 'package:condo_app/config/theme/app_theme.dart';
import 'package:condo_app/models/models.dart';
import 'package:condo_app/providers/providers.dart';
import 'package:condo_app/providers/white_list_provider.dart';
import 'package:condo_app/screens/visitors/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class VisitorWhiteListPage extends ConsumerStatefulWidget {
  static const name = 'VisitorWhiteListPage';
  const VisitorWhiteListPage({super.key});

  @override
  VisitorWhiteListPageState createState() => VisitorWhiteListPageState();
}

class VisitorWhiteListPageState extends ConsumerState<VisitorWhiteListPage> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(loadingProvider);
    final List<Finca> casas = ref.watch(fincasListProvider).when(
          data: (fincas) => fincas,
          loading: () => [],
          error: (error, stackTrace) => [],
        );
    final List<WhiteList?> whiteList = ref.watch(whiteListReg);
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Lista Blanca',
            style: TextStyle(color: AppTheme.primaryLight),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {
              ref.read(whiteListReg.notifier).state = [];
              Navigator.pop(context);
            },
          ),
          toolbarHeight: 80,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(appRouterProvider).push('/visitors/white-list/register');
          },
          backgroundColor: AppTheme.primaryLight,
          child: const Icon(Icons.add),
        ),
        body: Center(
          child: SizedBox(
            width: size.width < 600 ? size.width * 0.9 : size.width * 0.6,
            child: SearchConsultContainer(
                formKey: _formKey,
                casas: casas,
                loading: loading,
                ref: ref,
                whiteList: whiteList),
          ),
        ));
  }
}
