import 'package:flutter/material.dart';
import 'package:zens_evaluation_test/core/my_stream_controller.dart';
import 'package:zens_evaluation_test/core/size_config.dart';
import 'package:zens_evaluation_test/features/drink_detail/data/data_sources/drink_detailed_datasource.dart';
import 'package:zens_evaluation_test/features/drink_detail/data/repositories/drink_detail_repo_impl.dart';
import 'package:zens_evaluation_test/features/drink_detail/domain/entities/total_price.dart';
import 'package:zens_evaluation_test/features/drink_detail/domain/use_cases/get_options_usecase.dart';
import 'package:zens_evaluation_test/features/drink_detail/domain/use_cases/get_size_usecase.dart';
import 'package:zens_evaluation_test/features/drink_detail/domain/use_cases/get_toppings_usecase.dart';

import '../../../product_list/data/models/drink.dart';
import '../widgets/add_drink_widget.dart';
import '../widgets/drink_detail_header.dart';
import '../widgets/drink_detail_title.dart';
import '../widgets/pick_option_widget.dart';
import '../widgets/picksize_widget.dart';
import '../widgets/pick_topping_widget.dart';

class DrinkDetailScreen extends StatelessWidget {
  final Drink drink;
  final int cartCount;

  const DrinkDetailScreen({super.key, required this.drink, required this.cartCount});

  @override
  Widget build(BuildContext context) {
    final TotalPrice totalPrice = TotalPrice(0, 0, 0);
    final MyStreamController<TotalPrice> totalPriceController =
        MyStreamController<TotalPrice>();
    final GetSizeUseCase sizeUseCase =
        GetSizeUseCase(DrinkDetailRepoImpl(DrinkDetailDataSourceImpl()));
    final GetToppingsUseCase toppingsUseCase =
        GetToppingsUseCase(DrinkDetailRepoImpl(DrinkDetailDataSourceImpl()));
    final GetOptionsUseCase optionsUseCase =
        GetOptionsUseCase(DrinkDetailRepoImpl(DrinkDetailDataSourceImpl()));

    return Scaffold(
      body: Stack(
        children: [
          DrinkDetailWidget(
            img: drink.img ?? "",
              cartCount: cartCount
          ),
          Container(
              width: SizeConfig.screenWidth,
              margin: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.28),
              padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  DrinkDetailTitle(
                    name: drink.name ?? "",
                    description: drink.description ?? "",
                    price: drink.price ?? 0.0,
                    salePrice: drink.salePrice ?? 0.0,
                    rating: drink.rating ?? 0.0,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        PickSizeWidget(
                          getSizeUseCase: sizeUseCase,
                          onChanged: (double value) {
                            totalPrice.sizePrice = value;
                            totalPriceController.updateState(totalPrice);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        PickToppingWidget(
                          getToppingsUseCase: toppingsUseCase,
                          onChanged: (double value) {
                            totalPrice.toppingPrice = value;
                            totalPriceController.updateState(totalPrice);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        PickOptionWidget(
                          getOptionsUseCase: optionsUseCase,
                          onChanged: (double value) {
                            totalPrice.optionPrice = value;
                            totalPriceController.updateState(totalPrice);
                          },
                        ),
                      ],
                    ),
                  ))
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: StreamBuilder<TotalPrice>(
              stream: totalPriceController.stream,
              initialData: totalPrice,
              builder: (context, snapshot) {
                return AddDrinkWidget(
                  toppingPrice: snapshot.data!.toppingPrice,
                  sizePrice: snapshot.data!.sizePrice,
                  optionPrice: snapshot.data!.optionPrice,
                  drinkPrice: drink.price ?? 0.0,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
