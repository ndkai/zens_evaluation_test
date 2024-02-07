import 'package:flutter/material.dart';
import 'package:zens_evaluation_test/core/size_config.dart';
import 'package:zens_evaluation_test/features/product_list/data/data_sources/product_list_datasource.dart';
import 'package:zens_evaluation_test/features/product_list/domain/use_cases/get_drink_usecase.dart';

import '../../data/repositories/product_list_repo_impl.dart';
import '../widgets/drink_list_view.dart';
import '../widgets/product_list_action_bar.dart';
import '../widgets/product_list_header.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    GetDrinksUseCase getDrinksUseCase = GetDrinksUseCase(ProductListRepoImpl(ProductListDataSourceImpl()));
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const ProductListHeader(),
              ProductListActionBar(valueChanged: (value) {  },),
              DrinkListView(getDrinksUseCase: getDrinksUseCase,)
            ],
          ),
        ),
      ),
    );
  }

}

