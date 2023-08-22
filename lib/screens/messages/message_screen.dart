import 'package:condo_app/config/router/app_router.dart';
import 'package:condo_app/config/theme/app_theme.dart';
import 'package:condo_app/screens/messages/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageScreen extends ConsumerStatefulWidget {
  static const name = 'MessageScreen';
  const MessageScreen({super.key});

  @override
  MessageScreenState createState() => MessageScreenState();
}

class MessageScreenState extends ConsumerState<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Mensajes',
            style: TextStyle(color: AppTheme.colorIconsLight),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_outlined),
            color: const Color.fromARGB(255, 0, 121, 121),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.person_outline_sharp),
              color: const Color.fromARGB(255, 0, 121, 121),
              onPressed: () {
                ref.read(appRouterProvider).pop();
              },
            ),
          ],
          toolbarHeight: 80,
        ),
        body: Stack(children: [
          const TabContainer(),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                ref.read(appRouterProvider).go('/messages/new');
              },
              backgroundColor: AppTheme.primaryLight,
              child: const Icon(Icons.add),
            ),
          ),
        ]));
  }
}
