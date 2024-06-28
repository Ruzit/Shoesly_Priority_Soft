import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly_priority_soft/features/brand/data/models/brand_model.dart';
import 'package:shoesly_priority_soft/features/brand/presentation/widgets/brand_item.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/injection/injection.dart';
import '../../../brand/presentation/bloc/brand_bloc.dart';

class BrandListSlider extends StatefulWidget {
  final void Function(BrandModel? brand) onSelected;
  final BrandModel? selectedBrand;
  const BrandListSlider({
    super.key,
    required this.onSelected,
    this.selectedBrand,
  });

  @override
  State<BrandListSlider> createState() => _BrandListSliderState();
}

class _BrandListSliderState extends State<BrandListSlider> {
  final brandBloc = getIt<BrandBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => brandBloc..add(const BrandEvent.getBrandList()),
      child: BlocBuilder<BrandBloc, BrandState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox(),
            success: (brandList) => SizedBox(
              height: 50,
              child: Row(
                children: [
                  BrandItem(
                    brand:
                        BrandModel(name: 'All', logo: 'logo', totalProducts: 0),
                    isSelected: widget.selectedBrand == null,
                    onTap: () {
                      setState(() {
                        widget.onSelected(null);
                      });
                    },
                  ),
                  ...List.generate(
                    brandList.length,
                    (index) => BrandItem(
                      brand: brandList[index],
                      isSelected:
                          brandList[index].id == widget.selectedBrand?.id,
                      onTap: () {
                        setState(() {
                          widget.onSelected(brandList[index]);
                        });
                      },
                    ),
                  )
                ],
              ).scrollable(scrollDirection: Axis.horizontal),
            ),
          );
        },
      ),
    );
  }
}
