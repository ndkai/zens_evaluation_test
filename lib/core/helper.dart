

class Helper {

  static String formatCurrency(double amount) {
    String formattedAmount = amount.toStringAsFixed(2);
    formattedAmount = formattedAmount.replaceAll(RegExp(r'(?:(\.0)|(\.00))$'), '');
    RegExp regExp = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    formattedAmount = formattedAmount.replaceAllMapped(regExp, (Match match) => '${match[1]},');
    formattedAmount = '$formattedAmount đ';

    return formattedAmount;
  }
}
