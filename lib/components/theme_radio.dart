import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/store/l10n.dart';
import 'package:flutter_starter/store/theme.dart';

class ThemeRadio extends ConsumerWidget {
  const ThemeRadio({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var mode = ref.watch(themeProvider).toString();
    return ref.watch(l10nProvider).maybeWhen(
          orElse: () => const SizedBox(),
          data: (l10n) => Column(
            children: [
              Text(l10n.t.theme(mode)),
              ElevatedButton(
                onPressed: () => ref
                    .read(themeProvider.notifier)
                    .setThemeMode(ThemeMode.light),
                child: const Text('Light'),
              ),
              ElevatedButton(
                onPressed: () => ref
                    .read(themeProvider.notifier)
                    .setThemeMode(ThemeMode.dark),
                child: const Text('Dark'),
              ),
              ElevatedButton(
                onPressed: () => ref
                    .read(themeProvider.notifier)
                    .setThemeMode(ThemeMode.system),
                child: const Text('跟随系统'),
              ),
            ],
          ),
        );
  }
}
