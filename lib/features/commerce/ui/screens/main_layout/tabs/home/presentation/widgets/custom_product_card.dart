import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: colorScheme.primary.withOpacity(.3),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              /// 🔹 صورة المنتج
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://ecommerce.routemisr.com/Route-Academy-products/1678303324588-cover.jpeg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),

              /// 🔹 بيانات المنتج
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// 🔸 العنوان
                      Text(
                        'Unknown Product',
                        style: textTheme.bodyMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      /// 🔸 الوصف
                      Text(
                        'No description available',
                        style: textTheme.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 6),

                      /// 🔸 السعر
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'EGP 0',
                              style: textTheme.bodyMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '0',
                            style: textTheme.bodySmall?.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: colorScheme.primary.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),

                      // const SizedBox(height: 1),

                      /// 🔸 الريفيو + زرار
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Review (0.0)',
                              style: textTheme.bodySmall,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            style: IconButton.styleFrom(
                              backgroundColor: colorScheme.primary,
                              foregroundColor: colorScheme.onPrimary,
                              visualDensity: VisualDensity.compact,
                              shape: const CircleBorder(),
                            ),
                            icon: const Icon(Icons.add_rounded),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          /// 🔹 أيقونة الفافوريت (بدل SVG عشان كان فيه error)
          Positioned(
            top: 8,
            right: 8,
            child: CircleAvatar(
              backgroundColor: colorScheme.onPrimary,
              child: const Icon(Icons.favorite_border),
            ),
          ),
        ],
      ),
    );
  }
}
