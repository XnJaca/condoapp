import 'package:condo_app/models/models.dart';
import 'package:condo_app/services/casas_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fincaProvider = Provider<CasasService>((ref) {
  return CasasService();
});

final fincasListProvider = FutureProvider.autoDispose<List<Finca>>((ref) async {
  final List<Finca> condominios = await ref.read(fincaProvider).getFincas(ref);
  return condominios;
});
