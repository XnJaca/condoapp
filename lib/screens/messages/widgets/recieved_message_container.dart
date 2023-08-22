import 'package:condo_app/providers/providers.dart';
import 'package:condo_app/screens/messages/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecievedMessagesContainer extends ConsumerWidget {
  const RecievedMessagesContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: ref.watch(recivedListMessages).when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Center(
                child: Column(
              children: [
                const Text('Error al obtener los mensajes'),
                ElevatedButton(
                  onPressed: () async {
                    ref.read(recivedListMessages.future);
                  },
                  child: const Text('Reintentar'),
                ),
              ],
            )),
            data: (messages) {
              return messages.isNotEmpty
                  ? RefreshIndicator(
                      onRefresh: () async {
                        // ignore: unused_result
                        await ref.refresh(recivedListMessages.future);
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
          ),
    );
  }
}
