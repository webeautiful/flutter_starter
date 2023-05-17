import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocaleLogic {
  final Locale _defaultLocal = const Locale('en');

  AppLocalizations? _strings;
  AppLocalizations get strings => _strings!;
  bool get isLoaded => _strings != null;
  bool get isEnglish => strings.localeName == 'en';

  Future<void> load() async {
    Locale locale = _defaultLocal;

    // exit early on web as [findSystemLocale] throws errors as of Dec, 2022
    if (kIsWeb) return;

    if (kDebugMode) {
      // locale = Locale('zh'); // uncomment to test chinese
    }
    const localeCode = 'en'; //  await findSystemLocale();
    // settingsLogic.currentLocale.value ?? await findSystemLocale();
    // Try and find a supported locale
    locale = Locale(localeCode.split('_')[0]);
    // Fall back to default
    if (AppLocalizations.supportedLocales.contains(locale) == false) {
      locale = _defaultLocal;
    }

    // settingsLogic.currentLocale.value = locale.languageCode;
    _strings = await AppLocalizations.delegate.load(locale);
  }

  Future<void> loadIfChanged(Locale locale) async {
    bool didChange = _strings?.localeName != locale.languageCode;
    if (didChange && AppLocalizations.supportedLocales.contains(locale)) {
      _strings = await AppLocalizations.delegate.load(locale);
    }
  }
}
