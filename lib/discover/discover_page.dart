import 'package:app_ui/app_ui.dart';
import 'package:core/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog/auth/bloc/auth_bloc.dart';
import 'package:tindog/discover/bloc/discover_bloc.dart';
import 'package:tindog/discover/discover_view.dart';

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
    return Column(
      children: [
        CustomAppBar(
          label: label,
          caption: '📍Berlin, Germany',
        ),
        const Expanded(child: DiscoverView()),
      ],
    );
  }
}
