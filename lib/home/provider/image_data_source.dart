
import 'package:dio/dio.dart';
import 'package:excelledia/core/api_library.dart';
import 'package:excelledia/home/model/image_list.dart';

class ImageDataSource {
  final Dio _dioHttp = Dio();

  Future<List<ImageListModel>> getImageList(String searchQuery) async {
    List<ImageListModel> imageList = [];
    String path = APIurlLibrary.GET_IMAGE_API + "$searchQuery&image_type=photo";
    final response = await _dioHttp.get(
      path,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    for (var element in (response.data['hits'] as List)) {
      imageList.add(
        ImageListModel.fromJson(element),
      );
    }

    return imageList;
  }
}
