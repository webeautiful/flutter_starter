import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/assets.dart';
import 'package:flutter_starter/components/spot/market_list.dart';
import 'package:flutter_starter/store/l10n.dart';
import 'package:flutter_starter/store/spot.dart';
import 'package:flutter_starter/utils/log_util.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logI('[debug]build home page');
    return ref.watch(l10nProvider).whenOrNull(
              data: (l10n) => Scaffold(
                appBar: AppBar(
                  title: SearchBar(
                    hintText: l10n.t.searchPlaceholder,
                  ),
                ),
                body: Column(
                  children: [
                    Image.asset(
                      ImagePaths.appLogo,
                      width: 100,
                      height: 100,
                    ),
                    Text(
                      l10n.t.helloWorld('world'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ref.read(spotProvider.notifier).load();
                      },
                      child: const Text('重新加载数据'),
                    ),
                    Expanded(
                      child: ref.watch(usdtMarketProvider).maybeWhen(
                            orElse: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            data: (s) => MarketList(list: s),
                          ),
                    ),
                  ],
                ),
              ),
            ) ??
        const SizedBox();
  }
}
