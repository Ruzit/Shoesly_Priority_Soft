import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/constants/app_colors.dart';
import 'package:shoesly_priority_soft/core/enum/gender.dart';
import 'package:shoesly_priority_soft/core/utils/spacing_utils.dart';
import 'package:styled_widget/styled_widget.dart';

class GenderFilterView extends StatelessWidget {
  final Gender? gender;
  const GenderFilterView({super.key, this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w600),
        ).padding(horizontal: 24),
        verticalSpace(space: 12.0),
        ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: Gender.values.map(
            (e) {
              var isSelected = gender != null && gender == e;
              return Text(
                e.value,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w600),
              )
                  .padding(horizontal: 24)
                  .alignment(Alignment.center)
                  .decorated(
                    borderRadius: BorderRadius.circular(40),
                    color: isSelected ? blackColor : null,
                    border: isSelected ? null : Border.all(color: colorBorder),
                  )
                  .padding(horizontal: 8);
            },
          ).toList(),
        ).height(45),
      ],
    );
  }
}
