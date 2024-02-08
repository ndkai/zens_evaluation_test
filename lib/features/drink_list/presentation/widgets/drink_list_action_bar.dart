import 'package:flutter/material.dart';
import 'package:zens_evaluation_test/core/constant.dart';
import '../../../../core/keys.dart';
import '../../../../core/my_stream_controller.dart';
import 'cart_count_widget.dart';

class DrinkListActionBar extends StatelessWidget {
  DrinkListActionBar({Key? key}) : super(key: key);

  final MyStreamController<int> _dropdownController = MyStreamController<int>();

  final List<int> dropdownIndex = const <int>[0, 1, 2];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text("Tìm kiếm theo:   "),
            StreamBuilder<int>(
              stream: _dropdownController.stream,
              initialData: dropdownIndex.first,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return DropdownButton<int>(
                  value: snapshot.data!,
                  onChanged: (newValue) {
                    _handleDropdownChange(newValue);
                  },
                  items: dropdownIndex.map((int index) {
                    return DropdownMenuItem<int>(
                      value: index,
                      child: Text(
                        Constant.dropdownContent[index],
                        style: const TextStyle(

                          fontSize: 16.0,
                          color: Color(0xFFFE724C),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            )
          ],
        ),
        CartCountWidget(key: cartCountWidgetKey),
      ],
    );
  }

  void _handleDropdownChange(int? newValue) {
    if (newValue != null) {
      drinkListViewKey.currentState!.updateSortMethod(newValue);
      _dropdownController.updateState(newValue);
    }
  }
}
