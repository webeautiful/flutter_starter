import 'package:logger/logger.dart';

const String _tag = "demo";

var _logger = Logger(
    printer: PrettyPrinter(
  methodCount: 0,
));

void logV(String msg) {
  _logger.v("$_tag :: $msg");
}

void logD(String msg) {
  _logger.d("$_tag :: $msg");
}

void logI(String msg) {
  _logger.i("$_tag :: $msg");
}

void logW(String msg) {
  _logger.w("$_tag :: $msg");
}

void logE(String msg) {
  _logger.e("$_tag :: $msg");
}
