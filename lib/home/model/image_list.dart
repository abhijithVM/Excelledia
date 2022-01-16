import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_list.g.dart';

@JsonSerializable()
class ImageListModel extends Equatable {
  final int? id;
  final String? pageURL;
  final String? type;

  final String? previewURL;

  final String? largeImageURL;

  final int? views;
  final int? downloads;

  final int? likes;
  final int? comments;
  @JsonKey(name: "user_id")
  final int? userId;
  final String? userImageURL;
  final String? user;
  const ImageListModel({
    this.id,
    this.pageURL,
    this.type,
    this.previewURL,
    this.largeImageURL,
    this.views,
    this.downloads,
    this.likes,
    this.comments,
    this.userId,
    this.userImageURL,
    this.user,
  });
  @override
  List<Object> get props => [];
  factory ImageListModel.fromJson(Map<String, dynamic> json) =>
      _$ImageListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageListModelToJson(this);
}
