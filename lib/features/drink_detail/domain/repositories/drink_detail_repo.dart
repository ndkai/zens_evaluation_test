import '../../data/models/option.dart';

abstract class DrinkDetailRepo{
  Future<List<Option>> getOptions();
}