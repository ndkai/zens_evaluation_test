import 'package:flutter/material.dart';
import 'package:zens_evaluation_test/core/my_stream_controller.dart';

import '../../../../core/helper.dart';
import '../../../../core/provider_widget.dart';
import '../../../drink_list/domain/entities/no_param.dart';
import '../../data/models/size.dart';
import '../../domain/use_cases/get_size_usecase.dart';

class PickSizeWidget extends StatelessWidget {
  final GetSizeUseCase getSizeUseCase;
  final ValueChanged<double> onChanged;

  PickSizeWidget(
      {super.key, required this.getSizeUseCase, required this.onChanged});

  final MyStreamController<int> _toggleSizeController =
      MyStreamController<int>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Text("Chọn size",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                )),
            Text("(Bắt buộc)",
                style: TextStyle(
                  fontSize: 16.0,
                ))
          ],
        ),
        SizedBox(
          child: ProviderWidget<List<DrinkSize>>(
              future: getSizeUseCase.call(NoParam()),
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
                    return Column(children: _buildItem(data!, selectedValue));
                  },
                );
              }),
        )
      ],
    );
  }

  List<Widget> _buildItem(List<DrinkSize> sizes, int selectedValue) {
    List<Widget> widgets = <Widget>[];
    for (var i = 0; i < sizes.length; i++) {
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
                      onChanged(sizes[i].price!);
                      _toggleSizeController.updateState(value as int);
                    },
                  ),
                  Text(sizes[i].name!,
                      style:
                          const TextStyle(fontSize: 16.0, color: Colors.black))
                ],
              ),
              Text("+${Helper.formatCurrency(sizes[i].price!)}",
                  style: const TextStyle(fontSize: 16.0, color: Colors.black))
            ],
          ),
          const Divider()
        ],
      ));
    }
    return widgets;
  }
}
