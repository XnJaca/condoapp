import 'package:condo_app/config/router/app_router.dart';
import 'package:condo_app/providers/auth_provider.dart';
import 'package:condo_app/providers/general_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickalert/quickalert.dart';

class ActionsAppBar extends ConsumerWidget {
  const ActionsAppBar({
    super.key,
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final condoId = ref.watch(condominioId);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          // F2F2F2
          color: const Color.fromARGB(255, 242, 242, 242),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    IconButton(
                      icon: condoId.isEmpty
                          ? const Icon(Icons.person_outline_sharp)
                          : const Icon(Icons.email_outlined),
                      color: const Color.fromARGB(255, 0, 121, 121),
                      onPressed: () {
                        Navigator.pushNamed(context, 'message',
                            arguments: condoId);
                      },
                    ),
                    condoId.isNotEmpty
                        ? Positioned(
                            top: 2,
                            right: 2,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 18,
                                minHeight: 18,
                              ),
                              child: const Center(
                                child: Text(
                                  '3', // Cambia esto al número de badge deseado
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.logout_outlined),
                  color: const Color.fromARGB(255, 128, 128, 128),
                  onPressed: () async {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.confirm,
                      title: 'Cerrar sesión',
                      text: '¿Estás seguro de cerrar sesión?',
                      confirmBtnText: 'Sí',
                      cancelBtnText: 'No',
                      width: 300,
                      onConfirmBtnTap: () async {
                        await ref.read(authProvider).logout().then((value) {
                          ref.read(userProvider.notifier).state = null;
                          ref.read(appRouterProvider).go('/auth');
                        });
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
