part of 'getimagelist_bloc.dart';

abstract class GetimagelistEvent extends Equatable {
  const GetimagelistEvent();

  @override
  List<Object> get props => [];
}

class FetchImageListEvent extends GetimagelistEvent {
  final String searchQuery;

  const FetchImageListEvent(this.searchQuery);
}
