import 'package:zens_evaluation_test/features/product_list/data/data_sources/product_list_datasource.dart';
import 'package:zens_evaluation_test/features/product_list/data/models/option.dart';

import '../../domain/repositories/product_list_repo.dart';
import '../models/drink.dart';

class ProductListRepoImpl implements ProductListRepo{
  final ProductListDataSource productListDataSource;

  ProductListRepoImpl(this.productListDataSource);
  @override
  Future<List<Option>> getOptions() {
    return productListDataSource.getOptions();
  }
  @override
  Future<List<Drink>> getDrinks() {
    return productListDataSource.getDrinks();
  }
}