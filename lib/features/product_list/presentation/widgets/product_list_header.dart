import 'package:flutter/material.dart';

import '../../../../core/size_config.dart';

class ProductListHeader extends StatelessWidget {
  const ProductListHeader({ super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = SizeConfig.screenHeight ?? 0.0;

    return SizedBox(
      height: screenHeight * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Trà",
                style:  TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Text(
                "Mix",
                style: TextStyle(
                  fontFamily: 'Righteous',
                  fontSize: 40.0,
                  color: Color(0xFFFE724C),
                ),
              ),
              Text(
                "40 sự lựa chọn cho bạn",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          Image.asset("assets/images/beverages.png")
        ],
      ),
    );
  }


}
