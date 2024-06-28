import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/constants/app_colors.dart';
import 'package:shoesly_priority_soft/core/enum/product_color.dart';
import 'package:shoesly_priority_soft/core/utils/spacing_utils.dart';
import 'package:styled_widget/styled_widget.dart';

class ColorFilterView extends StatefulWidget {
  final ProductColor? color;
  final void Function(ProductColor) onSelected;

  const ColorFilterView({super.key, this.color, required this.onSelected});

  @override
  State<ColorFilterView> createState() => _ColorFilterViewState();
}

class _ColorFilterViewState extends State<ColorFilterView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
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
          children: ProductColor.values.map(
            (e) {
              var isSelected = widget.color != null && widget.color == e;
              return Row(
                children: <Widget>[
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: e.value,
                        border: e.value == Colors.white
                            ? Border.all(color: colorBorder)
                            : null),
                  ),
                  horizontalSpace(space: 8.0),
                  Text(
                    e.text,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  )
                ],
              )
                  .padding(horizontal: 24)
                  .alignment(Alignment.center)
                  .decorated(
                    borderRadius: BorderRadius.circular(40),
                    border: isSelected
                        ? Border.all(color: blackColor)
                        : Border.all(color: colorBorder),
                  )
                  .gestures(onTap: () => widget.onSelected(e))
                  .padding(horizontal: 8);
            },
          ).toList(),
        ).height(45),
      ],
    );
  }
}
