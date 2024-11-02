import 'package:app_itm/source/pantallas/agregar_registro.dart';
import 'package:app_itm/source/pantallas/mi_perfil.dart';
import 'package:app_itm/source/pantallas/principal.dart';
import 'package:app_itm/source/pantallas/ver_registro.dart';
import 'package:app_itm/source/widgets/gestorCombustible_drawer.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const MainScreen()),
    GoRoute(
        path: '/agregar', builder: (context, state) => const AgregarRegistro()),
    GoRoute(
        path: '/drawer',
        builder: (context, state) => const GestorcombustibleDrawer()),
    GoRoute(path: '/miProfile', builder: (context, state) => const MiPerfil()),
    GoRoute(
        path: '/registros', builder: (context, state) => const VerRegistro()),
  ]);
}
