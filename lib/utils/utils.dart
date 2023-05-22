String toStr(String? string) {
  return toStringWithDefault(string, '');
}

String toStringWithDefault(String? string, String defaultString) {
  if (string?.isNotEmpty == true) {
    return string ?? '';
  } else {
    return defaultString;
  }
}
