import 'package:zens_evaluation_test/features/product_list/domain/repositories/product_list_repo.dart';

import '../../../../core/usercase.dart';
import '../../data/models/option.dart';
import '../entities/no_param.dart';

class GetOptionsUseCase extends UseCase<List<Option>, NoParam>{
  final ProductListRepo productListRepo;

  GetOptionsUseCase(this.productListRepo);
  @override
  Future<List<Option>> call(NoParam params) {
    return productListRepo.getOptions();
  }

}