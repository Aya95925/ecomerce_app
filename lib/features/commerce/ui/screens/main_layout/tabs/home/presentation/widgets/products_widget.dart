

import 'package:ecomerce_app/core/utils/assets_manager.dart';
import 'package:ecomerce_app/core/utils/values_manager.dart';
import 'package:ecomerce_app/features/commerce/ui/screens/main_layout/tabs/home/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: GridView.builder(
        itemCount: 20,

        /// 🔥 أهم سطرين
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 7 / 9,
        ),
        itemBuilder: (context, index) {
          return CustomProductWidget(
            image: ImageAssets.categoryHomeImage,
            title: "Nike Air Jordon",
            price: 1100,
            rating: 4.7,
            discountPercentage: 10,
            height: height,
            width: width,
            description:
                "Nike is a multinational corporation that designs, develops, and sells athletic footwear, apparel, and accessories",
          );
        },
      ),
    );
  }
}
