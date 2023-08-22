import 'package:condo_app/config/router/app_router.dart';
import 'package:condo_app/providers/condomio_provider.dart';
import 'package:condo_app/providers/general_providers.dart';
import 'package:condo_app/screens/home/widgets/condominio_card.dart';
import 'package:condo_app/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  static const name = 'HomeScreen';
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/img/logoAppBar.png", width: 70),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        actions: [
          ActionsAppBar(ref: ref),
        ],
        toolbarHeight: 80,
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(condominioListProvider.future),
        child: Container(
          child: ref.watch(condominioListProvider).when(
                loading: () => const Center(
                    child:
                        CircularProgressIndicator()), // Mostrar un indicador de carga
                error: (error, stackTrace) => const Center(
                    child: Text('Error al obtener los condominios asociados')),
                data: (condominios) {
                  // Mostrar los condominios cargados
                  return ListView.builder(
                    itemCount: condominios.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: GestureDetector(
                          onTap: () {
                            ref.read(condominioId.notifier).state =
                                condominios[index].id!;
                            ref
                                .read(appRouterProvider)
                                .go('/casas/${condominios[index].id}');
                          },
                          child: CondominioCard(
                            name: condominios[index].nameCondominium!,
                            logoUrl: condominios[index].logoUrl!,
                            description: condominios[index].description!,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
        ),
      ),
    );
  }
}
