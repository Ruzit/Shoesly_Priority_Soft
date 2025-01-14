import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/features/auth/domain/auth_service.dart';

import '../../../core/routes/app_router.dart';

@RoutePage(name: 'ProfileRouter')
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // Simulated user profile data for demo purposes
  final String userName = "John Doe";
  final String userEmail = "johndoe@example.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Profile picture section
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.grey[200],
                child: Icon(
                  Icons.person,
                  size: 80,
                  color: Colors.grey[800],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // User name
            Text(
              userName,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),

            // User email
            Text(
              userEmail,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 30),

            // Logout button with better styling
            ElevatedButton(
              onPressed: () => AuthService().logout().then(
                (value) {
                  context.router
                      .popUntil((route) => false); // Pop all previous routes
                  context.router
                      .push(const LoginRouter()); // Navigate to login page
                },
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 14.0, horizontal: 32.0),
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 8.0,
                minimumSize: const Size(double.infinity, 60),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
