import 'package:condo_app/config/router/app_router.dart';
import 'package:condo_app/screens/account/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  static const name = 'ProfileScreen';
  const ProfileScreen(this.withScaffol, {super.key});

  final bool withScaffol;
  @override
  UserAccountScreenState createState() => UserAccountScreenState();
}

class UserAccountScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.withScaffol
        ? Scaffold(
            appBar: AppBar(
              title: const Text(
                'Mi cuenta',
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 0, 121, 121),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_outlined),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              toolbarHeight: 80,
            ),
            body: const SingleChildScrollView(
              child: Column(
                children: [
                  UserInformationContainer(),
                ],
              ),
            ),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                const UserInformationContainer(),
                TextButton(
                    onPressed: () {
                      ref.read(appRouterProvider).push('/account_state');
                    },
                    child: const Text("Ver Estado de Cuenta"))
              ],
            ),
          );
  }
}
