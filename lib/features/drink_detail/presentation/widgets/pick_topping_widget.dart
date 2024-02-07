import 'package:flutter/material.dart';
import 'package:zens_evaluation_test/core/my_stream_controller.dart';
import 'package:zens_evaluation_test/features/drink_detail/data/models/topping.dart';
import 'package:zens_evaluation_test/features/drink_detail/domain/use_cases/get_toppings_usecase.dart';

import '../../../../core/helper.dart';
import '../../../../core/provider_widget.dart';
import '../../../product_list/domain/entities/no_param.dart';

class PickToppingWidget extends StatelessWidget {
  final GetToppingsUseCase getToppingsUseCase;
  final ValueChanged<double> onChanged;
  PickToppingWidget({super.key, required this.getToppingsUseCase, required this.onChanged});

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

                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                )),
            Text("(Không bắt buộc)",
                style: TextStyle(

                  fontSize: 16.0,
                ))
          ],
        ),
        SizedBox(
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
                      child: Column(
                          children: _buildItem(data!, selectedValue)
                      )
                    );
                  },
                );
              }),
        )
      ],
    );
  }
  List<Widget> _buildItem(List<Topping> toppings, int selectedValue){
    List<Widget> widgets = <Widget>[];
    for(var i = 0; i < toppings.length; i++){
      widgets.add(Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Radio(
                    value: i,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      onChanged(toppings[i].price!);
                      _toggleSizeController
                          .updateState(value as int);
                    },
                  ),
                  Text(toppings[i].name!,
                      style: const TextStyle(

                          fontSize: 16.0,
                          color: Colors.black))
                ],
              ),
              Text(
                  "+${Helper.formatCurrency(toppings[i].price!)}",
                  style: const TextStyle(

                      fontSize: 16.0,
                      color: Colors.black))
            ],
          ),
          const Divider()
        ],
      ));
    }
    return widgets;
  }
}
