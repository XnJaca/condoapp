import 'package:condo_app/config/generated/generated.dart';
import 'package:condo_app/config/router/app_router.dart';
import 'package:condo_app/config/theme/app_theme.dart';
import 'package:condo_app/providers/general_providers.dart';
import 'package:condo_app/screens/fincas/fincas.dart';
import 'package:condo_app/screens/screens.dart';
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
      const VisitorsScreen(),
      const Center(child: Text("Reportes Screen")),
      const BoardScreen(),
      const ProfileScreen(false),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Image.asset("assets/img/logoAppBar.png", width: 70),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          leading: IconButton(
            icon: const Icon(Icons.business_sharp),
            color: AppTheme.primaryLight,
            onPressed: () {
              ref.read(condominioId.notifier).state = '';
              ref.read(appRouterProvider).go('/');
            },
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
          icon: const Icon(Icons.group_outlined),
          title: Text(AppLocalizations.of(context).menu_visitors),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.calendar_month_outlined),
          title: Text(AppLocalizations.of(context).menu_reservations),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.newspaper_rounded),
          title: Text(AppLocalizations.of(context).menu_pizarra),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.person),
          title: Text(AppLocalizations.of(context).title_account),
        ),
      ],
    );
  }
}
