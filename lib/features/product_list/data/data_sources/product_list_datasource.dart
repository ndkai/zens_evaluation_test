

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zens_evaluation_test/features/product_list/data/models/option.dart';

import '../models/drink.dart';

abstract class ProductListDataSource {
  Future<List<Option>> getOptions();
  Future<List<Drink>> getDrinks();
}

class ProductListDataSourceImpl implements ProductListDataSource {
  @override
  Future<List<Option>> getOptions() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/khoitd253/flutter_evalutation_test/main/data/option_json.json'));

    List<dynamic> jsonList = json.decode(response.body);
    List<Option> options = jsonList.map((json) => Option.fromJson(json)).toList();
    return options;
  }

  @override
  Future<List<Drink>> getDrinks() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/khoitd253/flutter_evalutation_test/main/data/drink_json.json'));
    List<dynamic> jsonList = json.decode(response.body);
    List<Drink> drinks = jsonList.map((json) => Drink.fromJson(json)).toList();
    return drinks;
  }
}
