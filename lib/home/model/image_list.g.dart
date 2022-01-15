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
      tags: json['tags'] as String?,
      previewURL: json['previewURL'] as String?,
      previewWidth: (json['previewWidth'] as num?)?.toDouble(),
      webformatURL: json['webformatURL'] as String?,
      webformatWidth: (json['webformatWidth'] as num?)?.toDouble(),
      webformatHeight: (json['webformatHeight'] as num?)?.toDouble(),
      largeImageURL: json['largeImageURL'] as String?,
      imageWidth: (json['imageWidth'] as num?)?.toDouble(),
      imageHeight: (json['imageHeight'] as num?)?.toDouble(),
      imageSize: (json['imageSize'] as num?)?.toDouble(),
      views: json['views'] as int?,
      downloads: json['downloads'] as int?,
      collections: json['collections'] as int?,
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
      'tags': instance.tags,
      'previewURL': instance.previewURL,
      'previewWidth': instance.previewWidth,
      'webformatURL': instance.webformatURL,
      'webformatWidth': instance.webformatWidth,
      'webformatHeight': instance.webformatHeight,
      'largeImageURL': instance.largeImageURL,
      'imageWidth': instance.imageWidth,
      'imageHeight': instance.imageHeight,
      'imageSize': instance.imageSize,
      'views': instance.views,
      'downloads': instance.downloads,
      'collections': instance.collections,
      'likes': instance.likes,
      'comments': instance.comments,
      'user_id': instance.userId,
      'userImageURL': instance.userImageURL,
      'user': instance.user,
    };
