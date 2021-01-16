import 'package:intl/intl.dart';

class MoneyFormat {
  static formatCurrency(int number) {
    final format =
        NumberFormat.currency(locale: 'vi_VN', symbol: '', decimalDigits: 0);
    return '${format.format(number / 100).trim()}đ'.replaceAll('.', ',');
  }
}
