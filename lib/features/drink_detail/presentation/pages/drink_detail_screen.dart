import 'package:flutter/material.dart';
import 'package:zens_evaluation_test/core/size_config.dart';
import 'package:zens_evaluation_test/features/drink_detail/data/data_sources/drink_detailed_datasource.dart';
import 'package:zens_evaluation_test/features/drink_detail/data/repositories/drink_detail_repo_impl.dart';
import 'package:zens_evaluation_test/features/drink_detail/domain/use_cases/get_options_usecase.dart';
import 'package:zens_evaluation_test/features/drink_detail/domain/use_cases/get_toppings_usecase.dart';
import 'package:zens_evaluation_test/features/drink_detail/presentation/widgets/pick_topping_widget.dart';
import 'package:zens_evaluation_test/features/product_list/data/models/drink.dart';

import '../../domain/use_cases/get_size_usecase.dart';
import '../widgets/drink_detail_header.dart';
import '../widgets/drink_detail_title.dart';
import '../widgets/pick_option_widget.dart';
import '../widgets/picksize_widget.dart';

class DrinkDetailScreen extends StatelessWidget {
  final Drink drink;

  const DrinkDetailScreen({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    GetSizeUseCase getSizeUseCase = GetSizeUseCase(DrinkDetailRepoImpl(DrinkDetailDataSourceImpl()));
    GetToppingsUseCase getToppingsUseCase = GetToppingsUseCase(DrinkDetailRepoImpl(DrinkDetailDataSourceImpl()));
    GetOptionsUseCase getOptionsUseCase = GetOptionsUseCase(DrinkDetailRepoImpl(DrinkDetailDataSourceImpl()));
    return Scaffold(
      body: Stack(
        children: [
          DrinkDetailWidget(img: drink.img!,),
          Container(
            width: SizeConfig.screenWidth,
            margin: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.28),
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)), color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DrinkDetailTitle(name: drink.name!, description: drink.description!, price: drink.price!, salePrice: drink.salePrice!, rating: drink.rating!,),
                  const SizedBox(height: 20,),
                  PickSizeWidget(
                    getSizeUseCase: getSizeUseCase,
                  ),
                  const SizedBox(height: 20,),
                  PickToppingWidget( getToppingsUseCase: getToppingsUseCase,),
                  const SizedBox(height: 20,),
                  PickOptionWidget(getOptionsUseCase: getOptionsUseCase,)
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
