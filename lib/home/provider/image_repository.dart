import 'package:dartz/dartz.dart';
import 'package:excelledia/home/model/image_list.dart';
import 'package:excelledia/home/provider/image_data_source.dart';
import 'package:excelledia/home/provider/utils/failure.dart';
import 'package:excelledia/home/provider/utils/repo.dart';

class ImageRepository {
  final ImageDataSource _remoteDataSource = ImageDataSource();
  Future<Either<Failure, List<ImageListModel>>> getImageList(
      String searchQuery) async {
    return repoExecute<List<ImageListModel>>(
        () async => _remoteDataSource.getImageList(searchQuery));
  }
}
