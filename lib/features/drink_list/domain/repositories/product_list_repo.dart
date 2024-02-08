import '../../data/models/drink.dart';
import '../../../drink_detail/data/models/option.dart';

abstract class ProductListRepo{
  Future<List<Option>> getOptions();
  Future<List<Drink>> getDrinks();
}