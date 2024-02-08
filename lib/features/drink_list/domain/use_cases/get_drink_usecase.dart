import '../../../../core/usercase.dart';
import '../../data/models/drink.dart';
import '../entities/no_param.dart';
import '../repositories/product_list_repo.dart';

class GetDrinksUseCase extends UseCase<List<Drink>, NoParam>{
  final ProductListRepo productListRepo;

  GetDrinksUseCase(this.productListRepo);
  @override
  Future<List<Drink>> call(NoParam params) {
    return productListRepo.getDrinks();
  }

}