import 'package:intl/intl.dart';

double str2num(String? str) {
  str ??= '';
  return double.tryParse(str) ?? 0;
}

String formatDecimal(String? num, int decimalPlaces) {
  if (num == null || num.isEmpty) {
    return '0.00';
  }
  double doubleValue = double.parse(num); // 将字符串转换为 double 类型
  if (doubleValue == 0.0) {
    return '0.00';
  }
  String formattedNum = doubleValue.toStringAsFixed(decimalPlaces);
  NumberFormat formatter = NumberFormat("#,###.##");
  formattedNum = formatter.format(double.parse(formattedNum));
  return formattedNum;
}

/// 格式化数字：超过999显示单元为k，超过999999显示单元为m
String formatCount(int count) {
  if (count.isNaN) return '0';
  if (count > 999999) {
    return '${(count / 100000).ceil() / 10}M';
  }
  if (count > 999) {
    return '${(count / 1000).ceil() / 10}K';
  }
  return '$count';
}

/// 遮盖手机号
String coverPhone(String phone) =>
    phone.replaceFirst(RegExp(r'\d{4}'), '***', 3);

/// 遮盖邮箱
String coverEmail(String email) => email.replaceAllMapped(
    RegExp(r'^(.{3})(.*)(.{2}@.+$)'), (m) => '${m[1]}***${m[3]}');

/// 格式化时间 英文月份 （秒级时间戳）
String formatTime(int timestamp) {
  if (timestamp == 0) {
    return '-';
  }
  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  if (timestamp.toString().length == 10) {
    timestamp *= 1000;
  }
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return '${months[date.month - 1]} ${date.day}, ${date.year}';
}
