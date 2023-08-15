import 'package:condo_app/config/generated/generated.dart';
import 'package:condo_app/config/theme/app_theme.dart';
import 'package:condo_app/models/models.dart';
import 'package:condo_app/providers/condomio_provider.dart';
import 'package:condo_app/providers/finca_provider.dart';
import 'package:condo_app/screens/fincas/fincas.dart';
import 'package:condo_app/screens/fincas/widgets/widgets.dart';
import 'package:condo_app/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class LobbyScreen extends ConsumerStatefulWidget {
  final String condominioId;

  const LobbyScreen({required this.condominioId, super.key});

  static const name = 'FincaScreen';

  @override
  LobbyScreenState createState() => LobbyScreenState();
}

class LobbyScreenState extends ConsumerState<LobbyScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      const FincaScreen(),
      const Center(child: Text("Tareas Screen")),
      // const ReportScreen(),
      const Center(child: Text("Comunicados Screen")),
      // const MessageScreen(),
    ];

    // final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Image.asset("assets/img/logoAppBar.png", width: 70),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          leading: const Icon(
            Icons.business,
            color: AppTheme.colorIconsLight,
          ),
          actions: [
            ActionsAppBar(ref: ref),
          ],
          toolbarHeight: 80,
        ),
        bottomNavigationBar: customBottomBar(context),
        body: IndexedStack(
          index: selectedIndex,
          children: screens,
        ));
  }

  SalomonBottomBar customBottomBar(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: selectedIndex,
      onTap: (value) {
        setState(() {
          selectedIndex = value;
        });
      },
      items: [
        SalomonBottomBarItem(
          icon: const Icon(Icons.home),
          title: Text(AppLocalizations.of(context).menu_home),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.add_task),
          title: Text(AppLocalizations.of(context).menu_task),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.newspaper_rounded),
          title: Text(AppLocalizations.of(context).menu_report),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.perm_contact_calendar),
          title: Text(AppLocalizations.of(context).menu_pizarra),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.local_post_office_outlined),
          title: Text(AppLocalizations.of(context).title_message),
        ),
      ],
    );
  }
}
