part of 'museum_list_bloc.dart';

abstract class MuseumListEvent extends Equatable {
  const MuseumListEvent();

  @override
  List<Object> get props => [];
}

class LoadMuseumItemsEvent extends MuseumListEvent {
  const LoadMuseumItemsEvent();
}

class MuseumItemClickedEvent extends MuseumListEvent {
  final ArtObjectModel item;

  const MuseumItemClickedEvent({required this.item});

  @override
  List<Object> get props => [item];
}
