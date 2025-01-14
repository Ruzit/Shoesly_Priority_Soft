import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/routes/app_router.dart';
import '../../domain/auth_service.dart';

@RoutePage(name: 'RegisterRouter')
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isRePasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // Set the background color of the page to white
      appBar: AppBar(
        backgroundColor: Colors.white, // AppBar background color to white
        centerTitle: false,
        title: const Text(
          'Register',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        toolbarHeight: 80,
        elevation: 0.0,
        actions: [
          // Logo at the top-right corner of the AppBar
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
            // Mobile number input with username icon instead of phone icon
            TextField(
              controller: _mobileController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Enter your name',
                prefixIcon: const Icon(Icons.person), // Username icon
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
            const SizedBox(height: 20.0),

            // Email input
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Enter your email',
                prefixIcon: const Icon(Icons.email),
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
            const SizedBox(height: 20.0),

            // Password input with visibility toggle
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Enter your password',
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
            const SizedBox(height: 20.0),

            // Re-enter password input with visibility toggle
            TextField(
              controller: _rePasswordController,
              obscureText: !_isRePasswordVisible,
              decoration: InputDecoration(
                labelText: 'Re-enter your password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _isRePasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _isRePasswordVisible = !_isRePasswordVisible;
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
            const SizedBox(height: 30.0),

            // Sign up button
            ElevatedButton(
              onPressed: () async {
                if (_passwordController.text != _rePasswordController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Passwords do not match")),
                  );
                  return;
                }
                await AuthService()
                    .registration(
                  name: _mobileController.text,
                  email: _emailController.text,
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
                'Sign Up',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 30.0),

            // Sign In link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(color: Colors.black),
                ),
                TextButton(
                  onPressed: () {
                    context.router.push(const LoginRouter());
                  },
                  child: const Text(
                    'Sign in',
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
