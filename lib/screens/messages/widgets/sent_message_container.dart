import 'package:condo_app/providers/providers.dart';
import 'package:condo_app/screens/messages/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SentMessagesContainer extends ConsumerWidget {
  const SentMessagesContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loadingProvider);
    return ref.watch(sentListMessages).when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Error al obtener los mensajes'),
                ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          ref.read(loadingProvider.notifier).state = true;
                          ref
                              .refresh(sentListMessages.future)
                              .catchError((error, stackTrace) {
                            ref.read(loadingProvider.notifier).state = false;
                          });
                        },
                  child: isLoading
                      ? const Text('Obteniendo mensajes...')
                      : const Text('Reintentar'),
                ),
              ],
            ),
          )),
          data: (messages) {
            return messages.isNotEmpty
                ? RefreshIndicator(
                    onRefresh: () async {
                      // ignore: unused_result
                      await ref.refresh(sentListMessages.future);
                    },
                    child: ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: MessageDetailContainer(
                            subject: messages[index].subject!,
                            senderName: messages[index].emitter!,
                            messageDate: messages[index].createdAt!,
                          ),
                        );
                      },
                    ),
                  )
                : const Center(
                    child: Text('No hay mensajes'),
                  );
          },
        );
  }
}
