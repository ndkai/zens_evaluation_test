import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:zens_evaluation_test/features/drink_detail/data/models/option.dart';

import '../models/size.dart';
import '../models/topping.dart';

abstract class DrinkDetailDataSource {
  Future<List<Option>> getOptions();
  Future<List<DrinkSize>> getSizes();
  Future<List<Topping>> getToppings();
}

class DrinkDetailDataSourceImpl implements DrinkDetailDataSource {
  @override
  Future<List<Option>> getOptions() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/khoitd253/flutter_evalutation_test/main/data/option_json.json'));

    List<dynamic> jsonList = json.decode(response.body);
    List<Option> options =
        jsonList.map((json) => Option.fromJson(json)).toList();
    return options;
  }

  @override
  Future<List<DrinkSize>> getSizes() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/khoitd253/flutter_evalutation_test/main/data/size_json.json'));

    List<dynamic> jsonList = json.decode(response.body);
    List<DrinkSize> sizes =
    jsonList.map((json) => DrinkSize.fromJson(json)).toList();
    return sizes;
  }

  @override
  Future<List<Topping>> getToppings() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/khoitd253/flutter_evalutation_test/main/data/topping_json.json'));

    List<dynamic> jsonList = json.decode(response.body);
    List<Topping> toppings =
    jsonList.map((json) => Topping.fromJson(json)).toList();
    return toppings;
  }


}
