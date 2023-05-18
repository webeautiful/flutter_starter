import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/store/l10n.dart';

class LanguageRadio extends ConsumerWidget {
  const LanguageRadio({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(l10nProvider).whenOrNull(
              data: (l10n) => Column(
                children: [
                  ElevatedButton(
                    onPressed: () => ref
                        .read(l10nProvider.notifier)
                        .loadIfChanged(const Locale('zh')),
                    child: Text(l10n.t.zh),
                  ),
                  ElevatedButton(
                    onPressed: () => ref
                        .read(l10nProvider.notifier)
                        .loadIfChanged(const Locale('en')),
                    child: Text(l10n.t.en),
                  ),
                ],
              ),
            ) ??
        const SizedBox();
  }
}
