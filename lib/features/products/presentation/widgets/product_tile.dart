import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly_priority_soft/core/widgets/app_network_image.dart';
import 'package:shoesly_priority_soft/features/brand/data/models/brand_model.dart';
import 'package:shoesly_priority_soft/features/products/data/models/product_model.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/firestore_collection.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/utils/firebase_config.dart';
import '../../../../core/utils/spacing_utils.dart';
import '../../../../gen/assets.gen.dart';

class ProductTile extends StatefulWidget {
  final ProductModel product;
  const ProductTile({super.key, required this.product});

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  BrandModel? brandModel;

  getBrands() async {
    final brandCollection =
        FirebaseFirestore.instance.collection(FirestoreCollection.brands);
    final brandCollectionService = FirebaseClient<BrandModel>(brandCollection);

    final brands = await brandCollectionService.readCollection(
      toMap: (Map<String, dynamic> data, String id) {
        return BrandModel.fromJson(data);
      },
    );
    brandModel =
        brands.firstWhere((element) => element.name == widget.product.brand);
    setState(() {});
  }

  @override
  void initState() {
    getBrands();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => context.router.push(const ProductDetailRouter()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: colorLightGrey,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  brandModel != null
                      ? SvgPicture.network(
                          brandModel?.logo ?? '',
                          height: 24,
                          width: 24,
                          colorFilter: const ColorFilter.mode(
                            productTileColor,
                            BlendMode.srcIn,
                          ),
                        ).padding(top: 8, left: 8, right: 8)
                      : const SizedBox(
                          height: 24,
                          width: 24,
                        ),
                  AppNetworkImage(
                    url: widget.product.thumbnail,
                  ).padding(horizontal: 16, vertical: 8).expanded(),
                ],
              ),
            ),
          ),
          verticalSpace(space: 8.0),
          Text(
            widget.product.name,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          verticalSpace(space: 4.0),
          Row(
            children: <Widget>[
              Assets.icons.star.svg(
                height: 14,
                width: 14,
              ),
              horizontalSpace(space: 4.0),
              Text(
                widget.product.avgRating.toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              horizontalSpace(space: 4.0),
              Text(
                '(${widget.product.totalReviews} Reviews)',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: productTileColor,
                    ),
              ),
            ],
          ),
          verticalSpace(space: 4.0),
          Text(
            '\$${widget.product.price}',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
