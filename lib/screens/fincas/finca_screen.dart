import 'package:condo_app/config/theme/app_theme.dart';
import 'package:condo_app/models/finca.dart';
import 'package:condo_app/providers/finca_provider.dart';
import 'package:condo_app/screens/fincas/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slide_popup_dialog_null_safety/slide_popup_dialog.dart'
    as slideDialog;

class FincaScreen extends ConsumerWidget {
  const FincaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    void showDialog(Finca finca) {
      slideDialog.showSlideDialog(
        context: context,
        child: Container(
            width: size.width * 0.8,
            height: size.height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: InfoFincaPopUp(
              size: size,
              finca: finca,
            )),
        barrierColor: Colors.white.withOpacity(0.7),
        pillColor: AppTheme.primaryLight,
        // F2F2F2
        backgroundColor: const Color(0xffF2F2F2),
      );
    }

    return Container(
      child: ref.watch(fincasListProvider).when(
            loading: () => const Center(
                child:
                    CircularProgressIndicator()), // Mostrar un indicador de carga
            error: (error, stackTrace) => const Center(
                child: Text('Error al obtener las fincas asociadas')),
            data: (fincas) {
              return GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                crossAxisCount: 3,
                childAspectRatio: size.width > 1000 ? 1.7 : 1,
                children: fincas.map((finca) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(finca);
                    },
                    child: FincaContainer(
                        size: size,
                        logoUrl: finca.condominium!.logoUrl!,
                        propertyNumber: finca.propertyNumber!),
                  );
                }).toList(),
              );
            },
          ),
    );
  }
}
