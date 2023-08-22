import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:condo_app/config/theme/app_theme.dart';
import 'package:condo_app/screens/messages/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabContainer extends ConsumerWidget {
  const TabContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          ButtonsTabBar(
            tabs: const [
              Tab(
                text: 'Recibidos',
              ),
              Tab(
                text: 'Enviados',
              ),
            ],
            backgroundColor: AppTheme.primaryLight,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            borderWidth: 0,
            unselectedBackgroundColor: Colors.white,
            labelStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              color: AppTheme.primaryLight,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TabBarView(
                children: <Widget>[
                  RecievedMessagesContainer(),
                  SentMessagesContainer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
