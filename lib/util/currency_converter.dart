import 'package:intl/intl.dart';

class CurrencyConverter {
  static String toBrazilianReal(double valor) {
    final formatter = new NumberFormat("R\$ ###,###.###", "pt-br");
    return formatter.format(valor);
  }
}
