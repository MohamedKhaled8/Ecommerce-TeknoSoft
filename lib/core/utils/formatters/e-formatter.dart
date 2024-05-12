import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class TFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  static String formatCurrency(double amount) {
    // Format currency with specified locale and symbol ($)
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6, 10)}';
    } else  if (phoneNumber.length == 11 && phoneNumber.startsWith('1')) {
      return '(${phoneNumber.substring(1, 4)}) ${phoneNumber.substring(4, 7)}-${phoneNumber.substring(7, 11)}';
    } else {
      return phoneNumber;
    }
  }

  static String internationFormatPhoneNuber(String phoneNumber) {
    // Remove all non-digit characters
    var digitOnly = phoneNumber.replaceAll(RegExp(r'\D'), "");

    String countryCode =
        '+${digitOnly.substring(0, digitOnly.startsWith('1') ? 1 : 2)}';
    digitOnly = digitOnly.substring(countryCode.startsWith('+1') ? 1 : 2);

    final formattedNumber = StringBuffer();
    formattedNumber.write(countryCode);

    if (countryCode.startsWith('+')) {
      formattedNumber.write(' ');
    }

    int i = 0;
    while (i < digitOnly.length) {
      int groupLength = (countryCode == '+1' && i == 0) ? 3 : 2;
      groupLength = (i + groupLength > digitOnly.length)
          ? digitOnly.length - i
          : groupLength;

      formattedNumber.write(digitOnly.substring(i, i + groupLength));

      if (i + groupLength < digitOnly.length) {
        formattedNumber.write('-');
      }

      i += groupLength;
    }

    return formattedNumber.toString();
  }

  static String getFormattedData(DateTime dateTime,
      {String format = 'dd MM yyyy'}) {
    return DateFormat(format).format(dateTime);
  }

  static List<T> removeDublicate<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidget(List<Widget> widget, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widget.length; i += rowSize) {
      final rowChildren = widget.sublist(
          i, i + rowSize > widget.length ? widget.length : i + rowSize);
      wrappedList.add(Row(
        children: rowChildren,
      ));
    }
    return wrappedList;
  }
}
