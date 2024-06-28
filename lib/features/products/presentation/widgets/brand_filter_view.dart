import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly_priority_soft/core/constants/app_colors.dart';
import 'package:shoesly_priority_soft/core/injection/injection.dart';
import 'package:shoesly_priority_soft/core/utils/spacing_utils.dart';
import 'package:shoesly_priority_soft/features/brand/presentation/bloc/brand_bloc.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../brand/data/models/brand_model.dart';

class BrandFilterView extends StatefulWidget {
  final void Function(BrandModel?) onSelected;
  final BrandModel? selectedBrand;
  const BrandFilterView(
      {super.key, required this.onSelected, this.selectedBrand});

  @override
  State<BrandFilterView> createState() => _BrandFilterViewState();
}

class _BrandFilterViewState extends State<BrandFilterView> {
  final _brandBloc = getIt<BrandBloc>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Brands',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w600),
        ).padding(horizontal: 24),
        verticalSpace(space: 12.0),
        BlocProvider(
          create: (context) => _brandBloc..add(const BrandEvent.getBrandList()),
          child: BlocBuilder<BrandBloc, BrandState>(
            builder: (context, state) {
              return state.maybeWhen(
                  orElse: () => const SizedBox(),
                  success: (brandList) {
                    return ListView.separated(
                      itemCount: brandList.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      separatorBuilder: (context, index) =>
                          horizontalSpace(space: 32.0),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => widget.onSelected(brandList[index]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Stack(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: colorLightGrey,
                                    radius: 30,
                                    child: SvgPicture.network(
                                        brandList[index].logo),
                                  ),
                                  if (widget.selectedBrand != null &&
                                      widget.selectedBrand!.name ==
                                          brandList[index].name)
                                    Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                        height: 16,
                                        width: 16,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: blackColor),
                                        child: const Center(
                                          child: Icon(
                                            Icons.check,
                                            size: 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                ],
                              ),
                              verticalSpace(space: 8.0),
                              Text(
                                brandList[index].name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${brandList[index].totalProducts} Items',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                        fontSize: 11, color: productTileColor),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  });
            },
          ),
        ).height(110),
      ],
    );
  }
}
