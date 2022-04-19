class DoubleFilter {
  static double formatDouble(String number) {
    if (number.length < 3) {
      if (number.contains(RegExp(r'[^\w\s]+'))) {
        return double.parse(number + '0'.replaceAll(RegExp(r'[^\w\s]+'), ''));
      } else {
        return double.parse(number + '0');
      }
    } else {
      if (number.contains(RegExp(r'[^\w\s]+'))) {
        return double.parse(number.replaceAll(RegExp(r'[^\w\s]+'), ''));
      } else {
        return double.parse(number);
      }
    }
  }
}
