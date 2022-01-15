part of 'getimagelist_bloc.dart';

abstract class GetimagelistState extends Equatable {
  const GetimagelistState();

  @override
  List<Object> get props => [];
}

class GetimagelistInitial extends GetimagelistState {}

class GetimagelistLoading extends GetimagelistState {}

class GetimagelistSuccess extends GetimagelistState {
  final List<ImageListModel> imageList;

  const GetimagelistSuccess(this.imageList);
}

class GetimagelistFailed extends GetimagelistState {}
