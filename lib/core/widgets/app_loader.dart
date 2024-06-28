import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/constants/app_colors.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: blackColor,
      ),
    );
  }
}
