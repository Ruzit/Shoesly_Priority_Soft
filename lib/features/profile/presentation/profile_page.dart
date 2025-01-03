import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/features/auth/domain/auth_service.dart';

import '../../../core/routes/app_router.dart';

@RoutePage(name: 'ProfileRouter')
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () => AuthService().logout().then(
                      (value) {
                        context.router.popUntil((route) => false);
                        context.router.push(const LoginRouter());
                      },
                    ),
                child: const Text('Logout')),
          )
        ],
      ),
    );
  }
}
