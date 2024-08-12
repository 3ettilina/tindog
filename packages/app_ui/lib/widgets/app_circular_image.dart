import 'dart:io';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppCircularImage extends StatelessWidget {
  const AppCircularImage.file({
    required this.image,
    this.size = 60,
    super.key,
  }) : url = null;

  const AppCircularImage.url({
    required this.url,
    this.size = 60,
    super.key,
  }) : image = null;

  final File? image;
  final String? url;
  final double size;

  @override
  Widget build(BuildContext context) {
    final imageWidget = (image != null)
        ? Image.file(
            File(image!.path),
            width: size,
            fit: BoxFit.cover,
          )
        : Image.network(
            url!,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) {
              if (progress == null) {
                return child;
              }
              return Assets.images.loadingPaws.image(width: size / 2);
            },
          );
    return SizedBox.square(
      dimension: size,
      child: Card(
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(size),
          child: imageWidget,
        ),
      ),
    );
  }
}
