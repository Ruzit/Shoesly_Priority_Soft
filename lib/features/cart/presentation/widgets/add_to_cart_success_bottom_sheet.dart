import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly_priority_soft/core/routes/app_router.dart';
import 'package:shoesly_priority_soft/core/utils/spacing_utils.dart';
import 'package:shoesly_priority_soft/core/widgets/app_button.dart';

import '../../../../core/constants/app_colors.dart';

class AddToCartSuccessBottomSheet extends StatelessWidget {
  const AddToCartSuccessBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 25),
      height: MediaQuery.sizeOf(context).height / 2.5,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: blackColor)),
            child: const Center(
              child: Icon(
                Icons.check,
                color: Colors.grey,
                size: 50,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Added to cart",
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "2 item total",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 06,
          ),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  buttonText: "BACK EXPLORE",
                  fontStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: blackColor, fontWeight: FontWeight.bold),
                  backgroundColor: Colors.white,
                  borderColor: borderColor,
                  onPressed: () {
                    context.maybePop();
                  },
                ),
              ),
              horizontalSpace(space: 20),
              Expanded(
                child: AppButton(
                  buttonText: "TO CART",
                  fontStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  backgroundColor: blackColor,
                  onPressed: () {
                    context.router.popAndPush(const CartPageRouter());
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
