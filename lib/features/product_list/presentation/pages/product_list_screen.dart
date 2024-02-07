import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zens_evaluation_test/core/size_config.dart';
import 'package:zens_evaluation_test/features/product_list/data/data_sources/product_list_datasource.dart';
import 'package:zens_evaluation_test/features/product_list/domain/entities/no_param.dart';
import 'package:zens_evaluation_test/features/product_list/domain/repositories/product_list_repo.dart';
import 'package:zens_evaluation_test/features/product_list/domain/use_cases/get_drink_usecase.dart';
import 'package:zens_evaluation_test/features/product_list/domain/use_cases/get_options_usecase.dart';

import '../../../../core/helper.dart';
import '../../data/repositories/product_list_repo_impl.dart';
import '../widgets/drink_list_view.dart';
import '../widgets/product_list_action_bar.dart';
import '../widgets/product_list_header.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    GetOptionsUseCase usecase = GetOptionsUseCase(ProductListRepoImpl(ProductListDataSourceImpl()));
    GetDrinksUseCase getDrinksUseCase = GetDrinksUseCase(ProductListRepoImpl(ProductListDataSourceImpl()));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ProductListHeader(),
            ProductListActionBar(getOptionsUseCase: usecase),
            DrinkListView(getDrinksUseCase: getDrinksUseCase,)
          ],
        ),
      ),
    );
  }

}

