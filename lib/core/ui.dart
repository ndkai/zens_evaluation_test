import '../features/product_list/data/models/drink.dart';

class UI{
  static List<Drink> sortListDrinks(List<Drink> drinks, int method){
    switch(method) {
      case 0:
        drinks.sort((a, b) => (a.rating ?? 0).compareTo(b.rating ?? 0));
        break;
      case 1:
        drinks.sort((a, b) => (b.favorite ?? 0).compareTo(a.favorite ?? 0));
        break;
      case 2:
        drinks.sort((a, b) => (a.price ?? 0).compareTo(b.price ?? 0));
        break;

    }

    return drinks;

  }
}