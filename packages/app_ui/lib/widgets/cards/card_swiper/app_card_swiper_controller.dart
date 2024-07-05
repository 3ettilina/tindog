import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class AppCardSwiperController extends CardSwiperController {
  AppCardSwiperController();

  void swipeRight() {
    super.swipe(CardSwiperDirection.right);
  }

  void swipeLeft() {
    super.swipe(CardSwiperDirection.left);
  }
}
