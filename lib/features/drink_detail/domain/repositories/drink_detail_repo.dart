import '../../data/models/option.dart';
import '../../data/models/size.dart';
import '../../data/models/topping.dart';

abstract class DrinkDetailRepo{
  Future<List<Option>> getOptions();
  Future<List<DrinkSize>> getSizes();
  Future<List<Topping>> getToppings();
}