import 'package:flutter/material.dart';
import 'package:zens_evaluation_test/core/my_stream_controller.dart';
import 'package:zens_evaluation_test/features/drink_detail/data/models/option.dart';
import 'package:zens_evaluation_test/features/drink_detail/domain/use_cases/get_options_usecase.dart';

import '../../../../core/helper.dart';
import '../../../../core/provider_widget.dart';
import '../../../drink_list/domain/entities/no_param.dart';

class PickOptionWidget extends StatelessWidget {
  final GetOptionsUseCase getOptionsUseCase;
  final ValueChanged<double> onChanged;
  PickOptionWidget({super.key, required this.getOptionsUseCase, required this.onChanged});

  final MyStreamController<int> _toggleSizeController =
      MyStreamController<int>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Text("Yêu cầu thành phần",
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
          child: ProviderWidget<List<Option>>(
              future: getOptionsUseCase.call(NoParam()),
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
                    return Column(
                        children: _buildItem(data!, selectedValue)
                    );
                  },
                );
              }),
        )
      ],
    );
  }

  List<Widget> _buildItem(List<Option> options, int selectedValue){
    List<Widget> widgets = <Widget>[];
    for(var i = 0; i < options.length; i++){
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
                      onChanged(options[i].price!);
                      _toggleSizeController
                          .updateState(value as int);
                    },
                  ),
                  Text(options[i].name!,
                      style: const TextStyle(

                          fontSize: 16.0,
                          color: Colors.black))
                ],
              ),
              Text(
                  "+${Helper.formatCurrency(options[i].price!)}",
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
