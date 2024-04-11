import 'package:intl/intl.dart';

extension TimeDifference on String {
  String differenceFromNow() {
    DateFormat dateFormat = DateFormat.Hm();
    DateTime currentTime = dateFormat.parse(dateFormat.format(DateTime.now()));
    DateTime tripStartTime = dateFormat.parse(this);
    return '${tripStartTime.difference(currentTime).inMinutes}';
  }
}
