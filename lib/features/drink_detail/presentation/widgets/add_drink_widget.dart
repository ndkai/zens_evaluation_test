import 'package:flutter/material.dart';
import 'package:zens_evaluation_test/core/helper.dart';
import 'package:zens_evaluation_test/core/my_stream_controller.dart';

import '../../../../core/size_config.dart';

class AddDrinkWidget extends StatelessWidget {
  final double sizePrice;
  final double toppingPrice;
  final double optionPrice;
  final double drinkPrice;

  const AddDrinkWidget(
      {super.key,
      required this.sizePrice,
      required this.toppingPrice,
      required this.optionPrice,
      required this.drinkPrice});

  @override
  Widget build(BuildContext context) {
    final MyStreamBroadcastController<int> drinkCountController =
        MyStreamBroadcastController<int>();
    int drinkCount = 1;
    return Container(
      constraints: BoxConstraints(
        maxHeight: SizeConfig.screenHeight! * 0.2,
        minHeight: SizeConfig.screenHeight! * 0.15,
      ),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  if (drinkCount > 0) {
                    drinkCount -= 1;
                  }
                  drinkCountController.updateState(drinkCount);
                },
                child: const CircleAvatar(
                  backgroundColor: Color(0xFFFE724C),
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              StreamBuilder(
                builder: (context, snapshot) {
                  return Text(
                      snapshot.data! < 10
                          ? "0${snapshot.data!}"
                          : snapshot.data!.toString(),
                      style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black));
                },
                stream: drinkCountController.stream,
                initialData: drinkCount,
              ),
              const SizedBox(
                width: 25,
              ),
              InkWell(
                onTap: () {
                  drinkCount += 1;
                  drinkCountController.updateState(drinkCount);
                },
                child: const CircleAvatar(
                  backgroundColor: Color(0xFFFE724C),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
              width: SizeConfig.screenWidth! * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: const Color(0xFFFE724C)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.shopping_bag,
                      color: Color(0xFFFE724C),
                    ),
                  ),
                  StreamBuilder<int>(
                    stream: drinkCountController.stream,
                    initialData: drinkCount,
                    builder: (context, snapshot) {
                      return Text(
                          "   Thêm vào đơn - ${Helper.formatCurrency((optionPrice + toppingPrice + sizePrice + drinkPrice) * snapshot.data!)}",
                          style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white));
                    },
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
