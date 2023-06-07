import 'package:flutter/material.dart';

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

bool isCollectionEmpty(Iterable? collection) {
  if (collection == null) {
    return true;
  } else {
    return collection.isEmpty;
  }
}

String assetsImagePath(String imageNamed) {
  List<String> stringArray = imageNamed.split('.');
  if (stringArray.length < 2) {
    imageNamed = '$imageNamed.png';
  }
  if (!imageNamed.startsWith('assets/')) {
    imageNamed = 'assets/images/$imageNamed';
  }
  return imageNamed;
}

AssetImage assetsImage(String imageNamed) {
  imageNamed = assetsImagePath(imageNamed);
  return AssetImage(imageNamed);
}
