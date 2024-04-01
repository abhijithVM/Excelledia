import 'package:dartz/dartz.dart';
import 'package:excelledia/home/model/image_list.dart';
import 'package:excelledia/home/datasource/repository.dart';
import 'package:excelledia/home/datasource/utils/failure.dart';
import 'package:excelledia/home/datasource/utils/repo.dart';

class ImageProvider {
  final ImageRepository _remoteDataSource = ImageRepository();
  Future<Either<Failure, List<ImageListModel>>> getImageList(
      String searchQuery) async {
    return repoExecute<List<ImageListModel>>(
        () async => _remoteDataSource.getImageList(searchQuery));
  }
}
