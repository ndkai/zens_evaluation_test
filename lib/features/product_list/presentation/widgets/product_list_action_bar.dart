import 'package:flutter/material.dart';
import 'package:zens_evaluation_test/features/product_list/domain/entities/no_param.dart';
import 'package:zens_evaluation_test/features/product_list/domain/use_cases/get_options_usecase.dart';

import '../../../../core/provider_widget.dart';
import '../../data/models/option.dart';
import '../manager/product_list_manager.dart';

class ProductListActionBar extends StatelessWidget {
  final GetOptionsUseCase getOptionsUseCase;

  ProductListActionBar({super.key, required this.getOptionsUseCase});

  final DropdownController _streamController = DropdownController();

  @override
  Widget build(BuildContext context) {
    String selectedValue = 'Option 1';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text("Tìm kiếm theo:   "),
            ProviderWidget<List<Option>>(
                future: getOptionsUseCase.call(NoParam()),
                onLoading: () {
                  return const Center(child: CircularProgressIndicator());
                },
                onError: (s) {
                  return const SizedBox();
                },
                onLoaded: (data) {
                  return DropdownButton<Option>(
                    value: data![0],
                    onChanged: (Option? newValue) {

                    },
                    items: data.map((Option option) {
                      return DropdownMenuItem<Option>(
                        value: option,
                        child: Text(option.name!, style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16.0,
                            color: Color(0xFFFE724C)
                        ),),
                      );
                    }).toList(),
                  );
                }),
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
              const Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
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
