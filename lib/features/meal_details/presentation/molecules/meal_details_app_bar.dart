import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/features/meal_details/presentation/atoms/meal_tag.dart';

class MealDetailsDelegate extends SliverPersistentHeaderDelegate {
  final double extendedHeight;
  final List<String> tags;
  final String name;
  final String imageUrl;

  MealDetailsDelegate({
    required this.extendedHeight,
    this.tags = const [],
    this.name = '',
    this.imageUrl = '',
  });
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
        Container(
          color: Theme.of(context).scaffoldBackgroundColor.withValues(
            alpha: 0.3 + (shrinkOffset / extendedHeight).clamp(0.0, 1.0) * 0.7,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 12),
              if (tags.every((element) => element.isNotEmpty))
                Wrap(
                  spacing: 8,
                  children: [...tags.map((e) => MealTag(text: e))],
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => extendedHeight;

  @override
  double get minExtent => kToolbarHeight + 51;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
