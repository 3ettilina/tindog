import 'package:app_ui/app_ui.dart';
import 'package:app_ui/cards/card_swiper/app_card_swiper_controller.dart';
import 'package:core/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog/auth/bloc/auth_bloc.dart';
import 'package:tindog/discover/bloc/discover_bloc.dart';

class DogsSwiper extends StatefulWidget {
  const DogsSwiper({required this.dogs, super.key});

  final List<Dog> dogs;

  @override
  State<DogsSwiper> createState() => _DogsSwiperState();
}

class _DogsSwiperState extends State<DogsSwiper> {
  late AppCardSwiperController controller;

  @override
  void initState() {
    controller = AppCardSwiperController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DiscoverBloc>();
    final currentDog = context.read<AuthBloc>().state.userDog!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppCardSwiper<Dog>(
              controller: controller,
              items: widget.dogs,
              cardBuilder: (dog) {
                return DogCard(
                  imageUrl: dog.imagePath,
                  name: dog.name,
                  age: dog.age.toString(),
                  gender: dog.gender.name,
                );
              },
              onSwipeRight: (dog) {
                bloc.add(
                  LikeDog(
                    myDog: currentDog,
                    dogToLike: dog,
                  ),
                );
              },
              onSwipeLeft: (dog) {
                bloc.add(
                  DislikeDog(
                    myDog: currentDog,
                    dogToDislike: dog,
                  ),
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: controller.swipeLeft,
                icon: Assets.images.nope.image(width: 50),
              ),
              IconButton(
                onPressed: controller.swipeRight,
                icon: Assets.images.like.image(width: 50),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
