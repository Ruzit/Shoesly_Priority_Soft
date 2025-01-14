import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/routes/app_router.dart';

import '../../domain/auth_service.dart';

@RoutePage(name: 'LoginRouter')
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      appBar: AppBar(
        backgroundColor: Colors.white, // Set AppBar background to white
        centerTitle: false,
        title: const Text(
          'Login',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        toolbarHeight: 80,
        elevation: 0.0,
        actions: [
          // Logo at the top-right corner of the AppBar with increased size
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Transform.scale(
              scale: 1.5, // Increase scale factor to make logo larger
              child: Image.asset(
                'assets/images/logo.png', // Update this path according to your assets
                height: 100.0, // Set a height that fits your needs
                width: 100.0, // Set a width that fits your needs
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Mobile number input
            TextField(
              controller: _mobileController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Enter email address',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
                ),
              ),
            ),
            const SizedBox(height: 30.0),

            // Password input with visibility toggle
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Enter your password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
                ),
              ),
            ),
            const SizedBox(height: 10.0),

            // Forgot password link
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Add forgot password action here
                },
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.black, fontSize: 14.0),
                ),
              ),
            ),
            const SizedBox(height: 30.0),

            // Login button
            ElevatedButton(
              onPressed: () async {
                await AuthService()
                    .login(
                  email: _mobileController.text,
                  password: _passwordController.text,
                )
                    .then((message) {
                  if (message!.contains('Success')) {
                    context.router.replace(const DashboardRouter());
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                    ),
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                elevation: 8.0,
                minimumSize: const Size(double.infinity, 60),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 30.0),

            // Sign Up link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(color: Colors.black),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to Register Page when "Sign up" is pressed
                    context.router.push(const RegisterRouter());
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
