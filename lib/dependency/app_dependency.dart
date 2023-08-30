import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example/data/api/museum_api.dart';
import 'package:flutter_example/data/networking/museum_network_client.dart';
import 'package:flutter_example/data/repository/museum_repository.dart';
import 'package:flutter_example/feature/login/bloc/login_bloc.dart';
import 'package:flutter_example/repository/auth_repository.dart';
import 'package:flutter_example/feature/museum_list/bloc/museum_list_bloc.dart';

class AppDependency extends StatelessWidget {
  AppDependency({super.key, required this.child}) {
    _museumApi = MuseumApi(MuseumNetworkClient());
    _museumRepository = MuseumRepository(_museumApi);
    _authRepository = AuthRepository();
  }

  late final MuseumApi _museumApi;
  late final MuseumRepository _museumRepository;
  late final AuthRepository _authRepository;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(_authRepository),
        ),
        BlocProvider<MuseumListBloc>(
          create: (_) => MuseumListBloc(_museumRepository)
            ..add(const LoadMuseumItemsEvent()),
        )
      ],
      child: child,
    );
  }
}
