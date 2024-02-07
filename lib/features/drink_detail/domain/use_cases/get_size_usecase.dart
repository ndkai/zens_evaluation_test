import 'package:zens_evaluation_test/features/drink_detail/domain/repositories/drink_detail_repo.dart';
import 'package:zens_evaluation_test/features/product_list/domain/repositories/product_list_repo.dart';

import '../../../../core/usercase.dart';
import '../../../product_list/data/models/drink.dart';
import '../../data/models/option.dart';
import '../../../product_list/domain/entities/no_param.dart';
import '../../data/models/size.dart';

class GetSizeUseCase extends UseCase<List<DrinkSize>, NoParam>{
  final DrinkDetailRepo productListRepo;

  GetSizeUseCase(this.productListRepo);
  @override
  Future<List<DrinkSize>> call(NoParam params) {
    return productListRepo.getSizes();
  }

}