import 'package:app_ui/app_ui.dart';
import 'package:core/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog/auth/bloc/auth_bloc.dart';
import 'package:tindog/discover/bloc/discover_bloc.dart';
import 'package:tindog/discover/dogs_swiper/cubit/dog_swiper_cubit.dart';

class DogsSwiper extends StatelessWidget {
  const DogsSwiper({required this.controller, super.key});

  final AppCardSwiperController controller;

  @override
  Widget build(BuildContext context) {
    final swiperCubit = context.read<DogSwiperCubit>();
    final currentDog = context.read<AuthBloc>().state.userDog!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocBuilder<DiscoverBloc, DiscoverState>(
              buildWhen: (prev, curr) {
                if (prev is DiscoverReadyState && curr is DiscoverReadyState) {
                  /// Re-build if we have new dogs to show on the swiper
                  return curr.dogs.length > prev.dogs.length;
                }
                return false;
              },
              builder: (context, state) {
                /// We should be sure by now that we're in this state
                if (state is DiscoverReadyState) {
                  final dogs = state.dogs;
                  return AppCardSwiper<Dog>(
                    controller: controller,
                    items: dogs,
                    cardBuilder: (dog) {
                      return DogCard(
                        imageUrl: dog.imagePath,
                        name: dog.name,
                        age: dog.age.toString(),
                        gender: dog.gender.name,
                        isNeutered: dog.isNeutered,
                        interests: dog.interests,
                      );
                    },
                    onSwipeRight: (dog) {
                      swiperCubit.likeDog(
                        myDog: currentDog,
                        dogToLike: dog,
                      );
                    },
                    onSwipeLeft: (dog) {
                      swiperCubit.dislikeDog(
                        myDog: currentDog,
                        dogToDislike: dog,
                      );
                    },
                  );
                }
                return const EmptyDogs();
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
