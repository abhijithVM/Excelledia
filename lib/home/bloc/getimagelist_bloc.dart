import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:excelledia/home/model/image_list.dart';
import 'package:excelledia/home/provider/image_data_source.dart';
part 'getimagelist_event.dart';
part 'getimagelist_state.dart';

class GetimagelistBloc extends Bloc<GetimagelistEvent, GetimagelistState> {
  final ImageDataSource _imageDataSource = ImageDataSource();
  GetimagelistBloc() : super(GetimagelistInitial()) {
    on<GetimagelistEvent>((event, emit) {
      if (event is FetchImageListEvent) {
        orderProductState();
      }
    });
  }

  Stream<GetimagelistState> orderProductState() async* {
    yield GetimagelistLoading();

    final dataResponse = await _imageDataSource.getImageList();

    if (dataResponse.isNotEmpty) {
      yield GetimagelistSuccess(dataResponse);
    } else {
      yield GetimagelistFailed();
    }
  }
}
