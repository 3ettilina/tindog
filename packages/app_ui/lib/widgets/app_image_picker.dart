import 'package:flutter/material.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';

class AppImagePicker extends StatelessWidget {
  const AppImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: FormBuilderImagePicker(
        name: 'imagePicker',
        decoration: const InputDecoration.collapsed(border: null, hintText: ''),
        fit: BoxFit.cover,
        maxImages: 1,
        transformImageWidget: (context, displayImage) => Card(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          child: SizedBox.expand(
            child: displayImage,
          ),
        ),
        availableImageSources: const [ImageSourceOption.gallery],
      ),
    );
  }
}
