import 'package:condo_app/models/models.dart';
import 'package:condo_app/services/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final visitorsProvider = Provider<VisitorsService>((ref) {
  return VisitorsService();
});

final visitorListProvider = StateProvider<List<Visitor?>>((ref) {
  return [];
});

final visitorsListProvider = FutureProvider<List<Visitor>>((ref) async {
  final List<Visitor> visitors =
      await ref.read(visitorsProvider).getVisitors(ref);
  ref.read(visitorListProvider.notifier).state = visitors;
  return visitors;
});
