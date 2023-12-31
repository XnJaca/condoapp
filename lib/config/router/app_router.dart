import 'package:condo_app/models/person.dart';
import 'package:condo_app/providers/user_provider.dart';
import 'package:condo_app/screens/screens.dart';
import 'package:condo_app/screens/visitors/pages/white_list/register_white_list.dart';
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
      GoRoute(
          path: '/board',
          name: BoardScreen.name,
          builder: (context, state) => const BoardScreen()),
      GoRoute(
          path: '/messages',
          name: MessageScreen.name,
          builder: (context, state) => const MessageScreen()),
      GoRoute(
        path: '/profile',
        name: ProfileScreen.name,
        builder: (context, state) => const ProfileScreen(true),
      ),
      GoRoute(
          path: '/account_state',
          name: AccountStatePage.name,
          builder: (context, state) => const AccountStatePage()),

      // Visitors
      GoRoute(
          path: '/visitors',
          name: VisitorsScreen.name,
          builder: (context, state) => const VisitorsScreen()),

      // Visitors Register
      GoRoute(
          path: '/visitors/register',
          name: VisitorRegisterPage.name,
          builder: (context, state) => const VisitorRegisterPage()),

      // Visitors White List
      GoRoute(
          path: '/visitors/white-list',
          name: VisitorWhiteListPage.name,
          builder: (context, state) => const VisitorWhiteListPage()),
      GoRoute(
          path: '/visitors/white-list/register',
          name: RegisterWhiteList.name,
          builder: (context, state) => const RegisterWhiteList()),

      // Visitors Records
      GoRoute(
          path: '/visitors/records',
          name: VisitorRecordsPage.name,
          builder: (context, state) => const VisitorRecordsPage()),
    ],
  );
});
