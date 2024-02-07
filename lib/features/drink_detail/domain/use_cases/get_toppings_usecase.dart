import 'package:zens_evaluation_test/features/drink_detail/domain/repositories/drink_detail_repo.dart';
import 'package:zens_evaluation_test/features/product_list/domain/repositories/product_list_repo.dart';

import '../../../../core/usercase.dart';
import '../../../product_list/data/models/drink.dart';
import '../../data/models/option.dart';
import '../../../product_list/domain/entities/no_param.dart';
import '../../data/models/size.dart';
import '../../data/models/topping.dart';

class GetToppingsUseCase extends UseCase<List<Topping>, NoParam>{
  final DrinkDetailRepo productListRepo;

  GetToppingsUseCase(this.productListRepo);
  @override
  Future<List<Topping>> call(NoParam params) {
    return productListRepo.getToppings();
  }

}