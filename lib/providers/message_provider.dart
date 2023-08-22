import 'package:condo_app/models/models.dart';
import 'package:condo_app/services/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final messageProvider = Provider<MessageService>((ref) {
  return MessageService();
});

final recivedListMessages = FutureProvider<List<Message>>((ref) async {
  final List<Message> messages =
      await ref.read(messageProvider).getRecivedMessages(ref);
  return messages;
});

final sentListMessages = FutureProvider<List<Message>>((ref) async {
  final List<Message> messages =
      await ref.read(messageProvider).getSentMessages(ref);
  return messages;
});
