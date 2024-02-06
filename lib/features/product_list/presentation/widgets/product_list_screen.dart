import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zens_evaluation_test/core/size_config.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight! * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
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
            )
          ],
        ),
      ),
    );
  }
}
