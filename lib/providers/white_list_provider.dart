import 'package:condo_app/models/models.dart';
import 'package:condo_app/services/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final whiteListProvider = Provider<WhiteListService>((ref) {
  return WhiteListService();
});

final whiteListReg = StateProvider<List<WhiteList?>>((ref) {
  return [];
});
