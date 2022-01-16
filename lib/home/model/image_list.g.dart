// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageListModel _$ImageListModelFromJson(Map<String, dynamic> json) =>
    ImageListModel(
      id: json['id'] as int?,
      pageURL: json['pageURL'] as String?,
      type: json['type'] as String?,
      previewURL: json['previewURL'] as String?,
      largeImageURL: json['largeImageURL'] as String?,
      views: json['views'] as int?,
      downloads: json['downloads'] as int?,
      likes: json['likes'] as int?,
      comments: json['comments'] as int?,
      userId: json['user_id'] as int?,
      userImageURL: json['userImageURL'] as String?,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$ImageListModelToJson(ImageListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pageURL': instance.pageURL,
      'type': instance.type,
      'previewURL': instance.previewURL,
      'largeImageURL': instance.largeImageURL,
      'views': instance.views,
      'downloads': instance.downloads,
      'likes': instance.likes,
      'comments': instance.comments,
      'user_id': instance.userId,
      'userImageURL': instance.userImageURL,
      'user': instance.user,
    };
