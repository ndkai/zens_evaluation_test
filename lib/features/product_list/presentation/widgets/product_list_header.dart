import 'package:flutter/material.dart';

import '../../../../core/size_config.dart';

class ProductListHeader extends StatelessWidget {
  const ProductListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Trà",
                style: TextStyle(
                  // You can use Poppins as the default font for this specific text widget.
                  fontFamily: 'Poppins',
                  fontSize: 20.0,
                ),
              ),
              Text(
                "Mix",
                style: TextStyle(
                  // You can use Poppins as the default font for this specific text widget.
                    fontFamily: 'Righteous',
                    fontSize: 40.0,
                    color: Color(0xFFFE724C)
                ),
              ),
              Text(
                "40 sự lựa chọn cho bạn",
                style: TextStyle(
                  // You can use Poppins as the default font for this specific text widget.
                  fontFamily: 'Poppins',
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
