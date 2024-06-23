import 'package:app_ui/cards/dog_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class DogsSwipper extends StatelessWidget {
  const DogsSwipper({
    required this.dogs,
    super.key,
  });

  final List<ImageProvider> dogs;

  @override
  Widget build(BuildContext context) {
    return CardSwiper(
      cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
        final dog = dogs[index];
        return DogCard(dogImage: dog);
      },
      cardsCount: dogs.length,
    );
  }
}
