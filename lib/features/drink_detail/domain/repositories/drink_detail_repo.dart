import '../../data/models/option.dart';
import '../../data/models/size.dart';

abstract class DrinkDetailRepo{
  Future<List<Option>> getOptions();
  Future<List<DrinkSize>> getSizes();
}