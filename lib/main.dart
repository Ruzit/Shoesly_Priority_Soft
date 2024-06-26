import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shoesly_priority_soft/config/app_theme.dart';
import 'package:shoesly_priority_soft/core/routes/app_router.dart';
import 'package:shoesly_priority_soft/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:shoesly_priority_soft/firebase_options.dart';

import 'core/injection/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await configureInjection();
  // await getIt<DataPopulation>().populate();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartBloc>(
      create: (context) =>
          getIt<CartBloc>()..add(const CartEvent.getCartItems()),
      child: MaterialApp(
        title: 'Shoesly',
        theme: AppTheme.lightTheme,
        home: const SizedBox(),
        builder: (context, child) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
          return FlutterEasyLoading(
            child: MaterialApp.router(
              // scaffoldMessengerKey: snackbarMessanger,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              themeMode: ThemeMode.light,
              routeInformationParser: _appRouter.defaultRouteParser(),
              routerDelegate: AutoRouterDelegate(
                _appRouter,
              ),
            ),
          );
        },
      ),
    );
  }
}
