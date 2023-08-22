import 'package:condo_app/models/models.dart';
import 'package:condo_app/services/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final boardProvider = Provider<BoardService>((ref) {
  return BoardService();
});

final boardListProvider = FutureProvider<List<Board>>((ref) async {
  final List<Board> boards = await ref.read(boardProvider).getBoards(ref);
  return boards;
});
