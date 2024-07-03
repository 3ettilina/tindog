import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog/discover/bloc/discover_bloc.dart';
import 'package:tindog/discover/view/dog_swiper.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverState>(builder: (context, state) {
      return switch (state) {
        DiscoverFetchingDogsState() => Center(
            child: Assets.images.loadingPaws.image(width: 100),
          ),
        DiscoverReadyState(dogs: final d) when d.isEmpty => const EmptyDogs(),
        DiscoverReadyState() => DogsSwiper(dogs: state.dogs),
        DiscoverErrorFetchingDogsState() => Center(
            child: Assets.animations.error.lottie(width: 100, repeat: false),
          ),
      };
    });
  }
}
