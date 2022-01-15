// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:dio/dio.dart';
import 'package:excelledia/core/api_library.dart';
import 'package:excelledia/home/model/image_list.dart';

class ImageDataSource {
  final Dio _dioHttp = Dio();

  Future<List<ImageListModel>> getImageList() async {
    List<ImageListModel> imageList = [];

    final response = await _dioHttp.get(
      APIurlLibrary.GET_IMAGE_API,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    (response.data['hits'] as List).forEach((element) {
      imageList.add(
        ImageListModel.fromJson(element),
      );
    });

    return imageList;
  }
}
