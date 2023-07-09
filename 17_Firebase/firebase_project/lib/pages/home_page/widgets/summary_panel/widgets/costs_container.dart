// Import Flutter
import 'package:flutter/material.dart';

// Import Packages
import 'package:intl/intl.dart' as intl;

class CostsContainer extends StatelessWidget {
  final String title;
  final double? count;

  const CostsContainer({super.key, required this.title, this.count});

  // Ф-я формирования суммы исходя из Локализации
  String _formatCurrency(BuildContext context, double curr) {
    final Locale locale = Localizations.localeOf(context);
    final getFormat = intl.NumberFormat.simpleCurrency(locale: locale.toString());
    final intl.NumberFormat newFormat = intl.NumberFormat.currency(locale: locale.toString(), name: getFormat.currencyName, symbol: getFormat.currencySymbol, decimalDigits: 2);

    return newFormat.format(curr);
  }

  // Ф-я проверки направления текста Справа-налево (true) или Слева-Направо (false) исходя из Локализации
  bool isRTL(BuildContext context) =>
    intl.Bidi.isRtlLanguage(Localizations.localeOf(context).languageCode);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text('$title',
              style: TextStyle(fontSize: 20, fontFamily: "Ubuntu",),
              textAlign: isRTL(context) ? TextAlign.left : TextAlign.right,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text('${_formatCurrency(context, count ?? 0)}',
              style: TextStyle(fontSize: 22, fontFamily: "Ubuntu", fontWeight: FontWeight.bold,),
              textAlign: isRTL(context) ? TextAlign.left : TextAlign.right,
            ),
          ),
        ],
    );
  }
}
