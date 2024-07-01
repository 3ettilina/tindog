import 'package:app_ui/app_ui.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog/app/routes/main_routes.dart';
import 'package:tindog/auth/bloc/auth_bloc.dart';
import 'package:tindog/firebase_options.dart';
import 'package:tindog/onboarding/bloc/onboarding_bloc.dart';
import 'package:tindog/onboarding/dog_details/bloc/dog_details_cubit.dart';
import 'package:tindog/onboarding/dog_image_selection/bloc/select_dog_image_bloc.dart';
import 'package:tindog_repository/tindog_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const TinDogApp());
}

class TinDogApp extends StatelessWidget {
  const TinDogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: MainProviders(),
    );
  }
}

class MainProviders extends StatelessWidget {
  const MainProviders({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthRepository();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => auth,
        ),
        RepositoryProvider(
          create: (context) => TindogRepository(
            authRepository: auth,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthBloc(),
          ),
          BlocProvider(
            create: (_) => OnboardingBloc(),
          ),
          BlocProvider(
            create: (ctx) => DogDetailsCubit(
              repository: ctx.read<TindogRepository>(),
            ),
            lazy: false,
          ),
          BlocProvider(
            create: (ctx) => SelectDogImageBloc(
              repository: ctx.read<TindogRepository>(),
            ),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: routes,
          title: 'TinDog',
          theme: AppTheme.light,
        ),
      ),
    );
  }
}
