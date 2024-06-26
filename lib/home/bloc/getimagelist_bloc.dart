// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:excelledia/home/model/image_list.dart';
import 'package:excelledia/home/datasource/provider.dart';
part 'getimagelist_event.dart';
part 'getimagelist_state.dart';

class GetimagelistBloc extends Bloc<GetimagelistEvent, GetimagelistState> {
  final ImageProvider _reopsitory = ImageProvider();
  GetimagelistBloc() : super(GetimagelistInitial());
  @override
  Stream<GetimagelistState> mapEventToState(GetimagelistEvent event) async* {
    if (event is FetchImageListEvent) {
      yield* getSearchImageList(event.searchQuery);
    }
  }

  Stream<GetimagelistState> getSearchImageList(String searchQuery) async* {
    yield (GetimagelistLoading());
    final result = await _reopsitory.getImageList(searchQuery);
    result.fold(
        (l) => emit(GetimagelistFailed()),
        (r) => emit(GetimagelistSuccess(
            r))); // Left fold for Failstate  Right fold for success
  }

//. to check Unit testing demo
  int sumofNum(int a, int b) => a + b;
}
