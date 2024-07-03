import 'package:app_ui/cards/card_swiper/app_card_swiper_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class AppCardSwiper<T> extends StatelessWidget {
  const AppCardSwiper({
    required this.items,
    required this.cardBuilder,
    required this.onSwipeRight,
    required this.onSwipeLeft,
    this.controller,
    super.key,
  });

  final AppCardSwiperController? controller;
  final Widget Function(T) cardBuilder;
  final List<T> items;
  final void Function(T item) onSwipeRight;
  final void Function(T item) onSwipeLeft;

  @override
  Widget build(BuildContext context) {
    return CardSwiper(
      controller: controller,
      cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
        final item = items[index];
        return cardBuilder(item);
      },
      cardsCount: items.length,
      numberOfCardsDisplayed: items.length > 1 ? 2 : 1,
      onSwipe: (oldIndex, currentIndex, direction) async {
        switch (direction) {
          case CardSwiperDirection.none:
            return false;
          case CardSwiperDirection.left:
          case CardSwiperDirection.bottom:
            final item = items[currentIndex!];
            onSwipeLeft(item);
            return true;
          case CardSwiperDirection.right:
          case CardSwiperDirection.top:
            final item = items[currentIndex!];
            onSwipeRight(item);
            return true;
        }
      },
    );
  }
}
