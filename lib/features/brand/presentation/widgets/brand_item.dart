import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/features/brand/data/models/brand_model.dart';

import '../../../../core/constants/app_colors.dart';

class BrandItem extends StatelessWidget {
  final BrandModel brand;
  final bool isSelected;
  final VoidCallback onTap;
  const BrandItem({
    super.key,
    required this.brand,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Text(
          brand.name,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: isSelected ? blackColor : productTileColor,
              ),
        ),
      ),
    );
  }
}
