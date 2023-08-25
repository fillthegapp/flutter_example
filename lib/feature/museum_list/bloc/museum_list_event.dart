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
  final ArtObjectModel items;

  const MuseumItemClickedEvent({required this.items});

  @override
  List<Object> get props => [items];
}
