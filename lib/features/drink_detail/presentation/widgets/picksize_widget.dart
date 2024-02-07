import 'package:flutter/material.dart';
import 'package:zens_evaluation_test/core/my_stream_controller.dart';
import 'package:zens_evaluation_test/core/size_config.dart';

import '../../../../core/helper.dart';
import '../../../../core/provider_widget.dart';
import '../../../product_list/domain/entities/no_param.dart';
import '../../data/models/size.dart';
import '../../domain/use_cases/get_size_usecase.dart';

class PickSizeWidget extends StatelessWidget {
  final GetSizeUseCase getSizeUseCase;
  PickSizeWidget({super.key, required this.getSizeUseCase});

  final MyStreamController<int> _toggleSizeController = MyStreamController<int>();
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const Row(
          children: [
            Text("Chọn size",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                )),
            Text("(Bắt buộc)",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                ))
          ],
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.2,
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
                  initialData: -1, // The initial value of the selected radio button.
                  builder: (context, snapshot) {
                    int selectedValue = snapshot.data ?? -1;
                    return MediaQuery.removePadding(context: context, child:  ListView.builder(
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
                                    _toggleSizeController.updateState(value as int);
                                  },
                                ),
                                Text(data![index].name!,  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.0,
                                    color: Colors.black
                                ))
                              ],
                            ),
                            Text("+${Helper.formatCurrency(data![index].price!)}",  style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16.0,
                                color: Colors.black
                            ))
                          ],
                        );
                      },
                    ), removeTop: true,);
                  },
                );
              }),
        )
      ],
    );
  }
}
