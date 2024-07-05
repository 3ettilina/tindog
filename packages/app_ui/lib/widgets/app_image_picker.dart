import 'dart:io';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AppImagePicker extends StatefulWidget {
  const AppImagePicker({
    required this.onImageSelected,
    this.isLoading = false,
    super.key,
  });

  final void Function(File) onImageSelected;
  final bool isLoading;

  @override
  State<AppImagePicker> createState() => _AppImagePickerState();
}

class _AppImagePickerState extends State<AppImagePicker> {
  File? selectedImage;

  Future<void> _openGallery() async {
    XFile? xImg = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (xImg != null) {
      final file = File(xImg.path);
      widget.onImageSelected(file);
      selectedImage = file;
    }
  }

  @override
  Widget build(BuildContext context) {
    late Widget content;
    if (selectedImage != null) {
      content = CircleAvatar(
          radius: 80,
          backgroundImage: Image.file(
            File(selectedImage!.path),
            height: 180,
            fit: BoxFit.cover,
          ).image);
    } else {
      content = Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        height: 180,
        child: Icon(
          Icons.camera_alt_rounded,
          color: Colors.grey.shade800,
        ),
      );
    }
    return GestureDetector(
      onTap: _openGallery,
      child: SizedBox(
        width: 150,
        child: Card(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          child: content,
        ),
      ),
    );
  }
}
