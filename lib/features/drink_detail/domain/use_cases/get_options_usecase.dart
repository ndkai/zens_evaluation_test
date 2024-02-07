import '../../../../core/usercase.dart';
import '../../../product_list/domain/entities/no_param.dart';
import '../../data/models/option.dart';
import '../repositories/drink_detail_repo.dart';

class GetOptionsUseCase extends UseCase<List<Option>, NoParam>{
  final DrinkDetailRepo productListRepo;

  GetOptionsUseCase(this.productListRepo);
  @override
  Future<List<Option>> call(NoParam params) {
    return productListRepo.getOptions();
  }

}