import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zens_evaluation_test/features/drink_detail/data/models/option.dart';

abstract class DrinkDetailDataSource {
  Future<List<Option>> getOptions();
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


}
