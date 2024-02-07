import 'package:flutter/material.dart';
import 'package:zens_evaluation_test/features/product_list/data/models/drink.dart';
import 'package:zens_evaluation_test/features/product_list/domain/use_cases/get_drink_usecase.dart';

import '../../../../core/provider_widget.dart';
import '../../domain/entities/no_param.dart';

class DrinkListView extends StatelessWidget {
  final GetDrinksUseCase getDrinksUseCase;

  const DrinkListView({super.key, required this.getDrinksUseCase});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ProviderWidget<List<Drink>>(
          future: getDrinksUseCase.call(NoParam()),
          onLoading: () {
            return const Center(child: CircularProgressIndicator());
          },
          onError: (s) {
            return const SizedBox();
          },
          onLoaded: (data) {
            return ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index) {
              return Text(data![index].name!);
            });
          }),
    );
  }
}
