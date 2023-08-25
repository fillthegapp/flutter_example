import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example/feature/login/bloc/login_bloc.dart';

class AppDependency extends StatelessWidget {
  const AppDependency({super.key, required this.child});

  // TODO: Declare here list of dependencies

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
      ],
      child: child,
    );
  }
}
