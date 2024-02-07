import '../../data/models/option.dart';

abstract class ProductListRepo{
  Future<List<Option>> getOptions();
}