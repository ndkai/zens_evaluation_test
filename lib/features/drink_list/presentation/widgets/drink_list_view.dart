import 'package:flutter/material.dart';
import 'package:zens_evaluation_test/core/size_config.dart';
import '../../../../core/helper.dart';
import '../../../../core/keys.dart';
import '../../../../core/my_stream_controller.dart';
import '../../../../core/provider_widget.dart';
import '../../../../core/ui.dart';
import '../../../drink_detail/presentation/pages/drink_detail_screen.dart';
import '../../data/models/drink.dart';
import '../../domain/entities/no_param.dart';
import '../../domain/use_cases/get_drink_usecase.dart';

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
            return BuildDrinkLisView(
              key: drinkListViewKey,
              drinks: data!,
            );
          }),
    );
  }
}

class BuildDrinkLisView extends StatefulWidget {
  final List<Drink> drinks;

  const BuildDrinkLisView({super.key, required this.drinks});

  @override
  State<BuildDrinkLisView> createState() => BuildDrinkLisViewState();
}

class BuildDrinkLisViewState extends State<BuildDrinkLisView> {
  late List<Drink> drinks;

  @override
  void initState() {
    super.initState();
    drinks = widget.drinks;
  }

  final MyStreamController<int> listViewArrangeController =
      MyStreamController<int>();

  void updateSortMethod(int method) {
    listViewArrangeController.updateState(method);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: listViewArrangeController.stream,
      initialData: 0,
      builder: (context, snapshot) {
        final items = UI.sortListDrinks(drinks, snapshot.data!);
        return ListView.builder(
            itemCount: drinks.length,
            itemBuilder: (context, index) {
              return DrinkListItem(
                drink: items[index],
              );
            });
      },
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
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DrinkDetailScreen(
                  drink: drink, cartCount: cartCountWidgetKey.currentState!.getCartCount(),
                )));
      },
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
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              Text(
                drink.description!,
                style: const TextStyle(
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
                          fontSize: 12.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      const Icon(Icons.favorite, color: Colors.red, size: 20),
                      Text(
                        "  ${Helper.formatNumber(drink.favorite!)}",
                        style: const TextStyle(
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
                    onTap: () {
                      const snackBar = SnackBar(
                        content: Text(
                          'Đã thêm vào giỏ hàng',
                          style: TextStyle(
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
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
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
