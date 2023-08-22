import 'package:condo_app/providers/board_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardScreen extends ConsumerStatefulWidget {
  static const name = 'board';
  const BoardScreen({super.key});

  @override
  BoardScreenState createState() => BoardScreenState();
}

class BoardScreenState extends ConsumerState<BoardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () => ref.refresh(boardListProvider.future),
      child: ref.watch(boardListProvider).when(
            data: (boards) {
              return boards.isNotEmpty
                  ? Center(
                      child: SizedBox(
                        width: size.width * 0.8,
                        child: ListView.builder(
                          itemCount: boards.length,
                          itemBuilder: (context, index) {
                            return Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Image.network(
                                      boards[index].attachment!,
                                      width: size.width * 0.8,
                                      height: size.height * 0.3,
                                      fit: BoxFit.fill,
                                    ),
                                    ListTile(
                                      contentPadding: const EdgeInsets.all(10),
                                      title: Text(boards[index].subject!),
                                      subtitle: Text(boards[index].body!),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(boards[index]
                                              .createdAt!
                                              .substring(0, 10)),
                                          Text(boards[index]
                                              .createdAt!
                                              .substring(11, 16)),
                                        ],
                                      ),
                                    )
                                  ],
                                ));
                          },
                        ),
                      ),
                    )
                  : const Center(
                      child: Text("No hay publicaciones aun."),
                    );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stackTrace) => const Center(
              child: Text("Servicio no disponible"),
            ),
          ),
    );
  }
}
