import 'package:condo_app/config/router/app_router.dart';
import 'package:condo_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VisitorsScreen extends StatefulWidget {
  static const name = 'VisitorsScreen';
  const VisitorsScreen({super.key});

  @override
  State<VisitorsScreen> createState() => _VisitorsScreenState();
}

class _VisitorsScreenState extends State<VisitorsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size);
    return Center(
      child: SizedBox(
        width: size.width < 600 ? size.width * 0.9 : size.width * 0.6,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: const [
            VisitorOptions(
              title: 'Gestionar Visitantes',
              route: '/visitors/records',
              icon: Icons.group_add_outlined,
              bgColor: Color.fromARGB(255, 116, 169, 203),
              textColor: Colors.white,
              iconColor: Colors.white,
            ),
            VisitorOptions(
              title: 'Gestionar Lista Blanca',
              route: '/visitors/white-list',
              icon: Icons.list_alt_outlined,
              bgColor: Color.fromARGB(255, 103, 155, 155),
              textColor: Colors.white,
              iconColor: Colors.white,
            ),
            VisitorOptions(
              title: 'Gestionar Registros',
              route: '/visitors/register',
              icon: Icons.app_registration,
              bgColor: Color.fromARGB(255, 168, 116, 191),
              textColor: Colors.white,
              iconColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class VisitorOptions extends ConsumerWidget {
  const VisitorOptions({
    super.key,
    required this.title,
    required this.route,
    required this.icon,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
    this.iconColor = Colors.black,
  });

  final String title, route;
  final IconData icon;
  final Color bgColor, textColor, iconColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(appRouterProvider).push(route);
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              size: 30,
              color: iconColor,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 30,
              color: iconColor,
            ),
          ],
        ),
      ),
    );
  }
}
