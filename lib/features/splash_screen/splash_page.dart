import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/injection/injection.dart';

import '../../core/routes/app_router.dart';
import '../../core/shared/session_manager/i_session_manager.dart';

@RoutePage(name: 'SplashRouter')
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _navigateToNextPage() async {
    final token = await getIt<ISessionManager>().getToken();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (token != null) {
          context.router.replace(const DashboardRouter());
        } else {
          context.router.replace(const LoginRouter());
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'SHOESLY',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
                fontSize: 36,
              ),
        ),
      ),
    );
  }
}
