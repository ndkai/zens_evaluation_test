import 'package:zens_evaluation_test/features/drink_detail/data/models/option.dart';

import '../../domain/repositories/drink_detail_repo.dart';
import '../data_sources/drink_detailed_datasource.dart';
import '../models/size.dart';
import '../models/topping.dart';

class DrinkDetailRepoImpl implements DrinkDetailRepo{
  final DrinkDetailDataSource detailDataSource;

  DrinkDetailRepoImpl(this.detailDataSource);
  @override
  Future<List<Option>> getOptions() {
    return detailDataSource.getOptions();
  }

  @override
  Future<List<DrinkSize>> getSizes() {
    return detailDataSource.getSizes();
  }

  @override
  Future<List<Topping>> getToppings() {
    return detailDataSource.getToppings();
  }

}