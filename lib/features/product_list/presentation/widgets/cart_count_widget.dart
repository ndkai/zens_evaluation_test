import 'package:flutter/material.dart';

import '../../../../core/my_stream_controller.dart';

class CartCountWidget extends StatefulWidget {
  const CartCountWidget({super.key});

  @override
  State<CartCountWidget> createState() => CartCountWidgetState();
}

class CartCountWidgetState extends State<CartCountWidget> {
  final MyStreamController<int> _cartCountController =
      MyStreamController<int>();
  int _initCartCountValue = 0;

  void updateCartCount() {
    _initCartCountValue += 1;
    _cartCountController.updateState(_initCartCountValue);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      height: 40,
      width: 40,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset("assets/icons/cart.png"),
          ),
          Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.red,
              child: StreamBuilder(
                  stream: _cartCountController.stream,
                  initialData: _initCartCountValue,
                  builder: (context, snapshot) {
                    return Text(
                      "${snapshot.data!}",
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _cartCountController.dispose();
    super.dispose();
  }
}
