import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog/discover/bloc/discover_bloc.dart';
import 'package:tindog/discover/dogs_swiper/dog_swiper.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    final swipeController = context.read<DiscoverBloc>().swiperController;
    return BlocBuilder<DiscoverBloc, DiscoverState>(
      buildWhen: (prev, curr) {
        if (prev is DiscoverReadyState && curr is DiscoverReadyState) {
          /// Re-build if we have new dogs to show on the swiper
          return curr.dogs.length > prev.dogs.length;
        }
        return true;
      },
      builder: (context, state) {
        return switch (state) {
          DiscoverFetchingDogsState() => Center(
              child: Assets.images.loadingPaws.image(width: 100),
            ),
          DiscoverReadyState(dogs: final d) when d.isEmpty => const EmptyDogs(),
          DiscoverReadyState() =>
            Expanded(child: DogsSwiper(controller: swipeController)),
          DiscoverErrorFetchingDogsState() => Center(
              child: Assets.animations.error.lottie(width: 100, repeat: false),
            ),
        };
      },
    );
  }
}
