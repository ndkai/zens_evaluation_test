import 'package:flutter/material.dart';

import '../../../../core/helper.dart';

class DrinkDetailTitle extends StatelessWidget {
  final String name;
  final String description;
  final double price;
  final double salePrice;
  final double rating;
  const DrinkDetailTitle({super.key, required this.name, required this.description, required this.price, required this.salePrice, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(

            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        Text(description,
            style: const TextStyle(

              fontSize: 16.0,
            )),
        const SizedBox(height: 8,),
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
                  "   $rating",
                  style: const TextStyle(

                      fontSize: 12.0,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  Helper.formatCurrency(price),
                  style: const TextStyle(

                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: 2.0,
                  ),
                ),
                const SizedBox(width: 10,),
                Text(
                  Helper.formatCurrency(salePrice),
                  style: const TextStyle(
                      fontFamily: 'Righteous',
                      fontSize: 20.0,
                      color: Color(0xFFFE724C)),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
