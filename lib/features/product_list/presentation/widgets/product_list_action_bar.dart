import 'package:flutter/material.dart';
import 'package:zens_evaluation_test/features/product_list/domain/entities/no_param.dart';
import 'package:zens_evaluation_test/features/product_list/domain/use_cases/get_options_usecase.dart';
import 'package:zens_evaluation_test/features/product_list/presentation/widgets/cart_count_widget.dart';

import '../../../../core/my_stream_controller.dart';
import '../../../../core/provider_widget.dart';
import '../../data/models/option.dart';

class ProductListActionBar extends StatelessWidget {
  final GetOptionsUseCase getOptionsUseCase;

  ProductListActionBar({super.key, required this.getOptionsUseCase});

  final MyStreamController<Option> _dropdownController =
      MyStreamController<Option>();


  @override
  Widget build(BuildContext context) {
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
                  return StreamBuilder<Option>(
                      stream: _dropdownController.stream,
                      initialData: data!.first,
                      builder: (context, snapshot) {
                        return DropdownButton<Option>(
                          value: snapshot.data!,
                          onChanged: (newValue) {
                            _dropdownController.updateState(newValue!);
                          },
                          items: data.map((Option option) {
                            return DropdownMenuItem<Option>(
                              value: option,
                              child: Text(
                                option.name!,
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.0,
                                    color: Color(0xFFFE724C)),
                              ),
                            );
                          }).toList(),
                        );
                      });
                }),
          ],
        ),
        CartCountWidget(key: cartCountWidgetKey,)
      ],
    );
  }


}
