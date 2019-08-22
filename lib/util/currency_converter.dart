import 'package:intl/intl.dart';

class CurrencyConverter {
  static String toBrazilianReal(double valor) {
    final formatter = new NumberFormat.currency(locale: "pt-br", symbol: "R\$", decimalDigits: 2, name: "BRA");
    return formatter.format(valor);
  }
}
