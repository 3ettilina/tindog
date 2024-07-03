import 'package:app_ui/app_ui.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog/app/routes/main_routes.dart';
import 'package:tindog/auth/bloc/auth_bloc.dart';
import 'package:tindog/discover/bloc/discover_bloc.dart';
import 'package:tindog/firebase_options.dart';
import 'package:tindog/onboarding/dog_details/bloc/add_dog_details_cubit.dart';
import 'package:tindog/onboarding/dog_image_selection/bloc/select_dog_image_bloc.dart';
import 'package:tindog/onboarding/request_location/bloc/location_request_bloc.dart';
import 'package:tindog/profile/cubit/profile_cubit.dart';
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
    final authRepo = AuthRepository();
    final tindogRepo = TindogRepository(authRepository: authRepo);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => authRepo),
        RepositoryProvider(create: (context) => tindogRepo),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthBloc(
              authRepository: authRepo,
              tindogRepository: tindogRepo,
            ),
          ),
          BlocProvider(create: (_) => ProfileCubit()),
          BlocProvider(create: (_) => LocationRequestBloc()),
          BlocProvider(create: (_) => DiscoverBloc(repository: tindogRepo)),
          BlocProvider(
            create: (_) => AddDogDetailsCubit(repository: tindogRepo),
          ),
          BlocProvider(
            create: (_) => SelectDogImageBloc(repository: tindogRepo),
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
