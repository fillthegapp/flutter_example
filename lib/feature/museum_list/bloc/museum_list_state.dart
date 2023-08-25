part of 'museum_list_bloc.dart';

abstract class MuseumListState extends Equatable {
  const MuseumListState();

  @override
  List<Object> get props => [];
}

class LoadingState extends MuseumListState {
  const LoadingState();
}

class LoadedState extends MuseumListState {
  final List<ArtObjectModel> items;

  const LoadedState({required this.items});

  @override
  List<Object> get props => [items];
}

class ErrorState extends MuseumListState {
  const ErrorState();
}
