import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:excelledia/home/model/image_list.dart';
import 'package:excelledia/home/provider/image_repository.dart';
part 'getimagelist_event.dart';
part 'getimagelist_state.dart';

class GetimagelistBloc extends Bloc<GetimagelistEvent, GetimagelistState> {
  final ImageRepository _repository = ImageRepository();
  GetimagelistBloc() : super(GetimagelistInitial());

  //  {
  //   on<GetimagelistEvent>((event, emit) {
  //     if (event is FetchImageListEvent) {
  //       orderProductState(event.searchQuery);
  //     }
  //   });
  // }
  @override
  Stream<GetimagelistState> mapEventToState(GetimagelistEvent event) async* {
    if (event is FetchImageListEvent) {
      yield* getSearchImageList(event.searchQuery);
    }
  }

  Stream<GetimagelistState> getSearchImageList(String searchQuery) async* {
    yield (GetimagelistLoading());
    final result = await _repository.getImageList(searchQuery);
    result.fold(
        (l) => emit(GetimagelistFailed()), (r) => emit(GetimagelistSuccess(r)));
  }

  // Stream<GetimagelistState> orderProductState(String searchQuery) async* {
  //   yield GetimagelistLoading();

  //   final dataResponse = await _imageDataSource.getImageList(searchQuery);

  //   if (dataResponse.isNotEmpty) {
  //     yield GetimagelistSuccess(dataResponse);
  //   } else {
  //     yield GetimagelistFailed();
  //   }
  // }
}
