import 'package:intl/intl.dart';

class RealFormat {

  static String format(double value) {
    final formatoReais = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return formatoReais.format(value);
  }
}