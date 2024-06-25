import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../gen/assets.gen.dart';
import '../constants/app_colors.dart';

class AppRatingBar extends StatelessWidget {
  final Function(double)? onUpdate;
  final double initialRating;
  final double maxRating;
  final double size;
  final bool ignoreGestures;
  const AppRatingBar(
      {super.key,
      this.onUpdate,
      required this.initialRating,
      required this.maxRating,
      this.size = 16,
      this.ignoreGestures = true});

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      ratingWidget: RatingWidget(
        full: Assets.icons.star.svg(),
        half: Assets.icons.star.svg(),
        empty: Assets.icons.star.svg(
            colorFilter: const ColorFilter.mode(
          colorLightGrey,
          BlendMode.srcIn,
        )),
      ),
      itemSize: size,
      initialRating: initialRating,
      maxRating: maxRating,
      allowHalfRating: false,
      ignoreGestures: ignoreGestures,
      onRatingUpdate: onUpdate ?? (value) {},
    );
  }
}
