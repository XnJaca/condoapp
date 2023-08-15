import 'package:condo_app/models/person.dart';
import 'package:condo_app/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = Provider<AuthService>((ref) {
  return AuthService();
});

final userProvider = StateProvider<Person?>((ref) {
  return null;
});

final loadingProvider = StateProvider<bool>((ref) {
  return false;
});

final userInStorageProvider = FutureProvider<Person?>((ref) async {
  final user = await ref.read(authProvider).getAuthUserInStorage(ref);
  ref.read(userProvider.notifier).state = user;
  return user;
});
