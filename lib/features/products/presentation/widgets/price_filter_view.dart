import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/spacing_utils.dart';
import '../../data/models/product_filter.dart';

class PriceFilterView extends StatefulWidget {
  final void Function(PriceRange) onChanged;
  final PriceRange? priceRange;
  const PriceFilterView({super.key, required this.onChanged, this.priceRange});

  @override
  State<PriceFilterView> createState() => _PriceFilterViewState();
}

class _PriceFilterViewState extends State<PriceFilterView> {
  Widget thumbWidget() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(width: 5, color: blackColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final values = SfRangeValues(
        widget.priceRange?.min ?? 10, widget.priceRange?.max ?? 1750);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Price Range',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w600),
        ).padding(horizontal: 24),
        verticalSpace(space: 16.0),
        SliderTheme(
          data: const SliderThemeData(
            activeTrackColor: Colors.red,
          ),
          child: SfRangeSlider(
            min: 0,
            max: 2000,
            activeColor: blackColor,
            inactiveColor: colorLightGrey,
            showLabels: true,
            enableTooltip: true,
            startThumbIcon: thumbWidget(),
            endThumbIcon: thumbWidget(),
            values: values,
            onChanged: (range) {
              widget.onChanged(PriceRange(min: range.start, max: range.end));
            },
            tooltipShape: const SfRectangularTooltipShape(),
            tooltipTextFormatterCallback: (actualValue, formattedText) =>
                '\$ $formattedText',
            labelFormatterCallback: (actualValue, formattedText) =>
                '\$ $formattedText',
          ).padding(horizontal: 16),
        ),
      ],
    );
  }
}
