import 'package:flutter/material.dart';

import '../../../../core/my_stream_controller.dart';

class CartCountWidget extends StatefulWidget {
  final int cartCount;
  const CartCountWidget({Key? key, this.cartCount = 0}) : super(key: key);

  @override
  State<CartCountWidget> createState() => CartCountWidgetState();
}

class CartCountWidgetState extends State<CartCountWidget> {
  final MyStreamController<int> _cartCountController = MyStreamController<int>();
  late int _initCartCountValue;

  @override
  void initState() {
    super.initState();
    _initCartCountValue = widget.cartCount;
  }

  int getCartCount(){
    return _initCartCountValue;
  }
  void updateCartCount() {
    _initCartCountValue += 1;
    _cartCountController.updateState(_initCartCountValue);
  }

  Widget _buildCartImage() {
    return Align(
      alignment: Alignment.center,
      child: Image.asset("assets/icons/cart.png"),
    );
  }

  Widget _buildCartCount() {
    return Align(
      alignment: Alignment.topRight,
      child: CircleAvatar(
        radius: 8,
        backgroundColor: Colors.red,
        child: StreamBuilder(
          stream: _cartCountController.stream,
          initialData: _initCartCountValue,
          builder: (context, snapshot) {
            return Text(
              "${snapshot.data ?? 0}",
              style: const TextStyle(
                fontSize: 10.0,
              ),
              overflow: TextOverflow.ellipsis,
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 40,
      width: 40,
      child: Stack(
        children: [
          _buildCartImage(),
          _buildCartCount(),
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
