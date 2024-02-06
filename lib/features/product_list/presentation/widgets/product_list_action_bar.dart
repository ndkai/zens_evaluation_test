import 'package:flutter/material.dart';

class ProductListActionBar extends StatelessWidget {
  const ProductListActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedValue = 'Option 1';
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text("Tìm kiếm theo:   "),
            DropdownButton<String>(
              value: selectedValue,
              onChanged: (String? newValue) {

              },
              items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
        SizedBox(
          height: 30,
          width: 50,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset("assets/icons/cart.png"),
              ),
              Align(
                alignment: Alignment.topRight,
                child:  CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                  child: Text("5"),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
