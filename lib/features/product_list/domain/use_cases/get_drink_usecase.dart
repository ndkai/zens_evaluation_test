import 'package:zens_evaluation_test/features/product_list/domain/repositories/product_list_repo.dart';

import '../../../../core/usercase.dart';
import '../../data/models/drink.dart';
import '../../../drink_detail/data/models/option.dart';
import '../entities/no_param.dart';

class GetDrinksUseCase extends UseCase<List<Drink>, NoParam>{
  final ProductListRepo productListRepo;

  GetDrinksUseCase(this.productListRepo);
  @override
  Future<List<Drink>> call(NoParam params) {
    return productListRepo.getDrinks();
  }

}