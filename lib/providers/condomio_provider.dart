import 'package:condo_app/models/models.dart';
import 'package:condo_app/services/condominio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final condominioProvider = Provider<CondominioService>((ref) {
  return CondominioService();
});

final condominioListProvider = FutureProvider<List<Condominio>>((ref) async {
  final List<Condominio> condominios =
      await ref.read(condominioProvider).getCondominios(ref);
  return condominios;
});
