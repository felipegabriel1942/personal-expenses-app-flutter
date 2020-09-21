import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrencyText extends StatelessWidget {
  final double value;
  final double fontSize;
  final Color color;
  final String prefixText;

  CurrencyText({
    @required this.value,
    this.fontSize,
    this.color,
    this.prefixText = ''
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormat = new NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '$prefixText ${currencyFormat.format(value)}',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize == null ? 15 : fontSize,
          color: color == null ? Colors.black : color,
        ),
      ),
    );
  }
}
