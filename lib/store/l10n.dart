import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl_standalone.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class L10n {
  const L10n({
    required this.currentLocale,
    required this.t,
  });
  final Locale currentLocale;
  final AppLocalizations t;

  L10n copyWith({Locale? currentLocale, AppLocalizations? t}) {
    return L10n(
      currentLocale: currentLocale ?? this.currentLocale,
      t: t ?? this.t,
    );
  }
}

class AsyncL10nNotifier extends AsyncNotifier<L10n> {
  final Locale _defaultLocal = const Locale('en');
  late SharedPreferences _prefs;
  static const _token = '@locale';

  Future<L10n> _fetchCurrentLocale() async {
    String? localeName = _prefs.getString(_token);
    String localeCode = localeName ?? await findSystemLocale();
    // Try and find a supported locale
    Locale locale = Locale(localeCode.split('_')[0]);
    // Fall back to default
    if (AppLocalizations.supportedLocales.contains(locale) == false) {
      locale = _defaultLocal;
    }

    AppLocalizations strings = await AppLocalizations.delegate.load(locale);
    return L10n(currentLocale: locale, t: strings);
  }

  @override
  Future<L10n> build() async {
    _prefs = await SharedPreferences.getInstance();
    // Load initial todo list from the remote repository
    return _fetchCurrentLocale();
  }

  Future<void> load() async {
    // exit early on web as [findSystemLocale] throws errors as of Dec, 2022
    if (kIsWeb) return;

    if (kDebugMode) {
      // locale = Locale('zh'); // uncomment to test chinese
    }
    // Set the state to loading
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => _fetchCurrentLocale());
  }

  Future<void> loadIfChanged(Locale locale) async {
    String? localeName = _prefs.getString(_token);

    bool didChange = localeName != locale.languageCode;
    if (didChange && AppLocalizations.supportedLocales.contains(locale)) {
      state = await AsyncValue.guard(() async {
        _prefs.setString(_token, locale.languageCode);
        return _fetchCurrentLocale();
      });
    }
  }
}

final l10nProvider =
    AsyncNotifierProvider<AsyncL10nNotifier, L10n>(() => AsyncL10nNotifier());
