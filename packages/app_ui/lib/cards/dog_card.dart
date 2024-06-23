import 'package:flutter/material.dart';

class DogCard extends StatelessWidget {
  const DogCard({
    required this.dogImage,
    super.key,
  });

  final ImageProvider dogImage;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: dogImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
