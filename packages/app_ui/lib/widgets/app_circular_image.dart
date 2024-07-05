import 'dart:io';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppCircularImage extends StatefulWidget {
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
  State<AppCircularImage> createState() => _AppCircularImageState();
}

class _AppCircularImageState extends State<AppCircularImage> {
  bool isLoading = true;

  void setLoading(bool inProgress) {
    setState(() {
      isLoading = inProgress;
    });
  }

  @override
  Widget build(BuildContext context) {
    final imageWidget = (widget.image != null)
        ? Image.file(
            File(widget.image!.path),
            width: widget.size,
            fit: BoxFit.cover,
          )
        : Image.network(
            widget.url!,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) {
              if (progress == null) {
                return child;
              }
              return Assets.images.loadingPaws.image(width: widget.size / 2);
            },
          );
    return SizedBox.square(
      dimension: widget.size,
      child: Card(
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(widget.size),
          child: imageWidget,
        ),
      ),
    );
  }
}
