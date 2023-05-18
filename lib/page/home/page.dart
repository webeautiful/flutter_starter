import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/assets.dart';
import 'package:flutter_starter/store/l10n.dart';
import 'package:flutter_starter/utils/log_util.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logI('[debug]build home page');
    return ref.watch(l10nProvider).whenOrNull(
              data: (l10n) => Container(
                color: Colors.greenAccent,
                child: SafeArea(
                  child: Column(
                    children: [
                      SearchBar(
                        hintText: l10n.t.searchPlaceholder,
                      ),
                      Image.asset(
                        ImagePaths.appLogo,
                        width: 100,
                        height: 100,
                      ),
                      Text(
                        l10n.t.helloWorld('world'),
                      ),
                    ],
                  ),
                ),
              ),
            ) ??
        const SizedBox();
  }
}
