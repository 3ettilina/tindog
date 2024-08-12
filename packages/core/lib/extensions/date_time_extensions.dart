import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String get timeHm {
    final formatter = DateFormat('Hm');
    return formatter.format(this);
  }
}
