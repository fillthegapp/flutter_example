import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example/domain/model/art_object_model.dart';
import 'package:flutter_example/feature/common/error/generic_error.dart';
import 'package:flutter_example/feature/museum_list/bloc/museum_list_bloc.dart';
import 'package:flutter_example/feature/museum_list/screen/art_object_card.dart';

class MuseumListScreen extends StatelessWidget {
  static const platform = MethodChannel('museum.list.test/flutter');
  const MuseumListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MuseumListBloc, MuseumListState>(
      builder: (context, state) {
        return _Screen(state);
      },
    );
  }
}

class _Screen extends StatelessWidget {
  final MuseumListState _state;

  const _Screen(this._state);

  @override
  Widget build(BuildContext context) {
    Widget body;

    if (_state is LoadingState) {
      body = _Loading();
    } else if (_state is ErrorState) {
      body = _Error();
    } else if (_state is LoadedState) {
      body = _Loaded(items: (_state as LoadedState).items);
    } else {
      throw Exception(
        'Developer, did you forget to add an UI representation for a State?',
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: body,
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _Loaded extends StatelessWidget {
  final List<ArtObjectModel> items;

  const _Loaded({
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        ArtObjectModel item = items[index];
        return ArtObjectCard(
          onClicked: () => context
              .read<MuseumListBloc>()
              .add(MuseumItemClickedEvent(item: item)),
          title: item.title,
          author: item.author,
          image: item.image,
        );
      },
    );
  }
}

class _Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GenericError(
      message: "Something went wrong loading museum data",
      onRetryClicked: () =>
          context.read<MuseumListBloc>().add(const LoadMuseumItemsEvent()),
    );
  }
}
