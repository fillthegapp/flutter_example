import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example/data/repository/museum_repository.dart';
import 'package:flutter_example/domain/model/art_object_model.dart';

part 'museum_list_event.dart';
part 'museum_list_state.dart';

class MuseumListBloc extends Bloc<MuseumListEvent, MuseumListState> {
  final MuseumRepository _museumRepository;

  MuseumListBloc(this._museumRepository) : super(const LoadingState()) {
    on<LoadMuseumItemsEvent>((event, emit) async {
      emit(const LoadingState());

      try {
        List<ArtObjectModel> items = await _museumRepository.getCollection();
        emit(LoadedState(items: items));
      } catch (e) {
        emit(const ErrorState());
      }
    });

    on<MuseumItemClickedEvent>((event, emit) async {
      // TODO: navigate / send tracking / other thing
      print('Clicked ${event.item.id}');
    });
  }
}
