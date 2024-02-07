import 'package:flutter/material.dart';
import 'package:zens_evaluation_test/core/helper.dart';
import 'package:zens_evaluation_test/core/size_config.dart';
import 'package:zens_evaluation_test/features/drink_detail/data/data_sources/drink_detailed_datasource.dart';
import 'package:zens_evaluation_test/features/drink_detail/data/repositories/drink_detail_repo_impl.dart';
import 'package:zens_evaluation_test/features/product_list/data/models/drink.dart';
import 'package:zens_evaluation_test/features/product_list/presentation/widgets/cart_count_widget.dart';

import '../../../product_list/data/data_sources/product_list_datasource.dart';
import '../../domain/use_cases/get_size_usecase.dart';
import '../widgets/drink_detail_header.dart';
import '../widgets/drink_detail_title.dart';
import '../widgets/pick_size_dish.dart';
import '../widgets/picksize_widget.dart';

class DrinkDetailScreen extends StatelessWidget {
  final Drink drink;

  const DrinkDetailScreen({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    GetSizeUseCase getSizeUseCase = GetSizeUseCase(DrinkDetailRepoImpl(DrinkDetailDataSourceImpl()));
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
            child: Column(
              children: [
                DrinkDetailTitle(name: drink.name!, description: drink.description!, price: drink.price!, salePrice: drink.salePrice!, rating: drink.rating!,),
                const SizedBox(height: 20,),
                PickSizeWidget(
                  getSizeUseCase: getSizeUseCase,
                ),
                PickSideDishWidget( getSizeUseCase: getSizeUseCase,)
              ],
            ),
          )

        ],
      ),
    );
  }
}
