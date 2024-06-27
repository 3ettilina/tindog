import 'package:app_ui/app_ui.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tindog/app/routes/main_routes.dart';
import 'package:tindog/auth/bloc/auth_bloc.dart';
import 'package:tindog/firebase_options.dart';
import 'package:tindog_repository/tindog_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: TinDogApp()));
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
    return RepositoryProvider(
      create: (context) => TindogRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthBloc(),
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
