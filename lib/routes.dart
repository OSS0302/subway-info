import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:subwayinfo_app/di/di_setup.dart';
import 'package:subwayinfo_app/ui/main_veiw_model.dart';
import 'package:subwayinfo_app/ui/mainscreen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => getIt<MainViewModel>(),
        child: const MainScreen(),
      ),
    ),
  ],
);