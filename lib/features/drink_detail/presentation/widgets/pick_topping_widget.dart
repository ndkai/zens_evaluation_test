import 'package:flutter/material.dart';
import 'package:zens_evaluation_test/core/my_stream_controller.dart';
import 'package:zens_evaluation_test/core/size_config.dart';
import 'package:zens_evaluation_test/features/drink_detail/data/models/topping.dart';
import 'package:zens_evaluation_test/features/drink_detail/domain/use_cases/get_toppings_usecase.dart';

import '../../../../core/helper.dart';
import '../../../../core/provider_widget.dart';
import '../../../product_list/domain/entities/no_param.dart';
import '../../data/models/size.dart';
import '../../domain/use_cases/get_size_usecase.dart';

class PickToppingWidget extends StatelessWidget {
  final GetToppingsUseCase getToppingsUseCase;

  PickToppingWidget({super.key, required this.getToppingsUseCase});

  final MyStreamController<int> _toggleSizeController =
      MyStreamController<int>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Text("Chọn món ăn kèm",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                )),
            Text("(Không bắt buộc)",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                ))
          ],
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.2,
          child: ProviderWidget<List<Topping>>(
              future: getToppingsUseCase.call(NoParam()),
              onLoading: () {
                return const Center(child: CircularProgressIndicator());
              },
              onError: (s) {
                return const SizedBox();
              },
              onLoaded: (data) {
                return StreamBuilder<int>(
                  stream: _toggleSizeController.stream,
                  initialData: -1,
                  // The initial value of the selected radio button.
                  builder: (context, snapshot) {
                    int selectedValue = snapshot.data ?? -1;
                    return MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        itemCount: data!.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: index,
                                    groupValue: selectedValue,
                                    onChanged: (value) {
                                      _toggleSizeController
                                          .updateState(value as int);
                                    },
                                  ),
                                  Text(data![index].name!,
                                      style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 16.0,
                                          color: Colors.black))
                                ],
                              ),
                              Text(
                                  "+${Helper.formatCurrency(data![index].price!)}",
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16.0,
                                      color: Colors.black))
                            ],
                          );
                        },
                      ),
                    );
                  },
                );
              }),
        )
      ],
    );
  }
}
