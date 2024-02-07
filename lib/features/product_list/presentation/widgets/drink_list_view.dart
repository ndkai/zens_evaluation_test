import 'package:flutter/material.dart';
import 'package:zens_evaluation_test/core/size_config.dart';
import 'package:zens_evaluation_test/features/product_list/data/models/drink.dart';
import 'package:zens_evaluation_test/features/product_list/domain/use_cases/get_drink_usecase.dart';
import 'package:zens_evaluation_test/features/product_list/presentation/widgets/cart_count_widget.dart';
import '../../../../core/helper.dart';
import '../../../../core/my_stream_controller.dart';
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
                  return DrinkListItem(
                    drink: data![index],
                  );
                });
          }),
    );
  }
}

class DrinkListItem extends StatelessWidget {
  final Drink drink;

  const DrinkListItem({super.key, required this.drink});
  @override
  Widget build(BuildContext context) {
    final MyStreamController<bool> favoriteController =
    MyStreamController<bool>();
    bool initFavorite = false;
    return SizedBox(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenWidth! / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(drink.img!), fit: BoxFit.fitWidth)),
              ),
              Text(
                drink.name!,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              Text(
                drink.description!,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20,
                      ),
                      Text(
                        "  ${drink.rating!}",
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      const Icon(Icons.favorite, color: Colors.red, size: 20),
                      Text(
                        "  ${drink.favorite!}",
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  InkWell(
                    child: Image.asset(
                      "assets/icons/add.png",
                      width: 70,
                    ),
                    onTap: (){
                      const snackBar = SnackBar(
                        content: Text('Đã thêm vào giỏ hàng', style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14.0,
                        ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                      cartCountWidgetKey.currentState!.updateCartCount();
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    Helper.formatCurrency(drink.salePrice!),
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    initFavorite = !initFavorite;
                    favoriteController.updateState(initFavorite);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: StreamBuilder<bool>(
                        stream: favoriteController.stream,
                        initialData: initFavorite,
                        builder: (context, snapshot) {
                          return snapshot.data!
                              ? const Icon(
                            Icons.favorite_outlined,
                            color: Colors.red,
                          )
                              : const Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
