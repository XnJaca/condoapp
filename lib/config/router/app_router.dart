import 'package:condo_app/models/person.dart';
import 'package:condo_app/providers/auth_provider.dart';
import 'package:condo_app/screens/auth/auth_screen.dart';
import 'package:condo_app/screens/auth/register_screen.dart';
import 'package:condo_app/screens/fincas/lobby_screen.dart';
import 'package:condo_app/screens/home/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  AsyncValue<Person?> authUser = ref.watch(userInStorageProvider);

  return GoRouter(
    initialLocation: authUser.value != null ? '/' : '/auth', // Corregido
    routes: [
      GoRoute(
        path: '/',
        name: HomeScreen.name,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
          path: '/casas/:id',
          name: LobbyScreen.name,
          builder: (context, state) {
            final condominioId = state.pathParameters['id'] ?? 'no-id';
            return LobbyScreen(condominioId: condominioId);
          }),
    ],
  );
});



// final appRouterProvider = Provider<GoRouter>((ref) {
//   AsyncValue<User?> authUser =
//       ref.read(userInStorageProvider); // Obtén el resultado del FutureProvider
//   authUser.whenData((user) {
//     ref.read(userProvider.notifier).state =
//         user; // Establecer el valor en userProvider
//   });
//   return GoRouter(
//     initialLocation: authUser.hasValue ? '/' : '/auth',
//     routes: [
//       GoRoute(
//         path: '/',
//         builder: (context, state) => const HomeScreen(),
//       ),
//       GoRoute(
//         path: '/auth',
//         builder: (context, state) => AuthScreen(),
//       ),
//     ],
//   );
// });
