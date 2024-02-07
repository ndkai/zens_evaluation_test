import 'package:zens_evaluation_test/features/product_list/data/data_sources/product_list_datasource.dart';
import 'package:zens_evaluation_test/features/drink_detail/data/models/option.dart';

import '../../domain/repositories/drink_detail_repo.dart';
import '../data_sources/drink_detailed_datasource.dart';

class DrinkDetailRepoImpl implements DrinkDetailRepo{
  final DrinkDetailDataSource detailDataSource;

  DrinkDetailRepoImpl(this.detailDataSource);
  @override
  Future<List<Option>> getOptions() {
    return detailDataSource.getOptions();
  }

}