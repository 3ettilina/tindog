import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog/auth/bloc/auth_bloc.dart';

extension BuildContextX on BuildContext {
  AuthBloc get authBloc => read<AuthBloc>();
}
