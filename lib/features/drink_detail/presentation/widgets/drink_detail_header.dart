import 'package:flutter/material.dart';
import 'package:zens_evaluation_test/core/size_config.dart';

import '../../../product_list/presentation/widgets/cart_count_widget.dart';

class DrinkDetailWidget extends StatelessWidget {
  final String img;
  const DrinkDetailWidget({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(
          left: 10, right: 10, top: SizeConfig.screenHeight! * 0.07),
      height: SizeConfig.screenHeight! * 0.3,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(img), fit: BoxFit.fitWidth),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white),
              child: const Center(
                child: Icon(Icons.arrow_back_ios_new),
              ),
            ),
          ),
          const CartCountWidget()
        ],
      ),
    );
  }
}
