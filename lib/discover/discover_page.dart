import 'package:app_ui/app_ui.dart';
import 'package:core/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tindog/auth/bloc/auth_bloc.dart';
import 'package:tindog/discover/bloc/discover_bloc.dart';
import 'package:tindog/discover/dogs_swiper/cubit/dog_swiper_cubit.dart';
import 'package:tindog/discover/view/discover_view.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({
    required this.label,
    required this.detailsPath,
    super.key,
  });

  final String label;
  final String detailsPath;

  @override
  Widget build(BuildContext context) {
    final dog = context.select<AuthBloc, Dog?>((bloc) => bloc.state.userDog);
    if (dog != null) {
      context.read<DiscoverBloc>().add(FetchDogs(myDog: dog));
    }
    return DogsDidMatchListener(
      child: Column(
        children: [
          AppHeader(
            label: label,
            caption: '📍Berlin, Germany',
          ),
          const DiscoverView(),
        ],
      ),
    );
  }
}

class DogsDidMatchListener extends StatelessWidget {
  const DogsDidMatchListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DogSwiperCubit, DogSwiperState>(
      listenWhen: (prev, curr) => curr is DidMatch,
      listener: (context, state) {
        final st = state as DidMatch;
        showAdaptiveDialog(
          context: context,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: MatchCard(
              myDogName: st.myDog.name,
              myDogImageUrl: st.myDog.imagePath,
              likedDogName: st.likedDog.name,
              likedDogImageUrl: st.likedDog.imagePath,
              onPrimaryTap: () {
                context.goNamed('chats');
                context.pop();
              },
              onSecondaryTap: () {
                context.pop();
              },
            ),
          ),
        );
      },
      child: child,
    );
  }
}
