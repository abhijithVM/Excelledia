import 'package:dartz/dartz.dart';
import 'package:excelledia/home/model/image_list.dart';
import 'package:excelledia/home/provider/image_data_source.dart';
import 'package:excelledia/home/provider/utils/failure.dart';
import 'package:excelledia/home/provider/utils/repo.dart';

abstract class ModuleRepository {
  Future<Either<Failure, List<ImageListModel>>> getHubAttributeList(
      String searchQuery);
}

class ModuleRepositoryImpl extends ModuleRepository {
  final ImageDataSource _remoteDataSource;

  ModuleRepositoryImpl(
    this._remoteDataSource,
  );

  @override
  Future<Either<Failure, List<ImageListModel>>> getHubAttributeList(
      String searchQuery) async {
    return repoExecute<List<ImageListModel>>(
        () async => _remoteDataSource.getImageList(searchQuery));
  }
}
