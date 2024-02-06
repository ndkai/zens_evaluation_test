import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zens_evaluation_test/core/size_config.dart';

import '../../../../core/helper.dart';
import '../widgets/product_list_action_bar.dart';
import '../widgets/product_list_header.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProductListHeader(),
            ProductListActionBar(),
          ],
        ),
      ),
    );
  }

}

