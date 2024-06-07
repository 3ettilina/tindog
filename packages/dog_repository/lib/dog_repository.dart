import 'package:dog_data_source/dog_data_source.dart';
import 'package:dog_data_source/local/dog_data_source_local.dart';

class DogRepository {
  DogRepository({
    DogDataSource? dataSource,
  }) : _dataSource = dataSource ?? DogDataSourceLocal();

  final DogDataSource _dataSource;
}
