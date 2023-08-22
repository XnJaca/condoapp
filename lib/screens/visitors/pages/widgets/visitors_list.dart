import 'package:condo_app/config/theme/app_theme.dart';
import 'package:condo_app/models/models.dart';
import 'package:condo_app/providers/visitors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VisitorsList extends ConsumerWidget {
  const VisitorsList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final List<Visitor?> visitors = ref.watch(visitorListProvider);
    return SizedBox(
      width: size.width * 0.8,
      child: ref.watch(visitorsListProvider).when(
            data: ((data) {
              return RefreshIndicator(
                onRefresh: () => ref.refresh(visitorsListProvider.future),
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Registro de visitas',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        ListTile(
                          leading: const Icon(
                            Icons.person,
                            size: 40,
                            color: AppTheme.colorIconsLight,
                          ),
                          // title: Text(data[index].nameVisitor!),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data[index].description!),
                              Text(data[index]
                                  .dateVisit
                                  .toString()), // Aquí muestro la fecha
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Color.fromARGB(255, 253, 117, 151),
                            ),
                            onPressed: () {
                              // Lógica para eliminar el visitante
                            },
                          ),
                        ),
                        const Divider(), // Línea separadora
                      ],
                    );
                  },
                ),
              );
            }),
            error: (error, stackTrace) => Column(
              children: [
                Text(error.toString()),
                ElevatedButton(
                  onPressed: () async {
                    ref.refresh(visitorsListProvider.future);
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
          ),
    );
  }
}
