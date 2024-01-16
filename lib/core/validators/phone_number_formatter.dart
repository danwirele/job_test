import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    newText = newText.replaceAll(RegExp(r'[^\d]'), '');

    if (newText.length > 11) {
      newText = newText.substring(0, 11);
    }

    String mask = '+7(***)***-**-**';

    for (int i = 1; i < newText.length; i++) {
      mask = mask.replaceFirst('*', newText[i]);
    }

    return TextEditingValue(
      text: mask,
      selection: TextSelection.collapsed(offset: mask.indexOf('*')),
    );
  }
}
