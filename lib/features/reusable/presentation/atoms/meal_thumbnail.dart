import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MealThumbnail extends CachedNetworkImage {
  MealThumbnail({super.key, required super.imageUrl})
    : super(
        height: 48,
        width: 48,
        fit: BoxFit.fitWidth,
        progressIndicatorBuilder:
            (context, url, progress) => SizedBox(
              height: 12,
              width: 12,
              child: CircularProgressIndicator(
                padding: EdgeInsets.all(8),
                value: progress.downloaded / (progress.totalSize ?? 1),
              ),
            ),
      );
}
