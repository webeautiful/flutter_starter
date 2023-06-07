import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/api/spot_api.dart';
import 'package:flutter_starter/components/c_toast.dart';
import 'package:flutter_starter/models/spot_market_entity.dart';

class AsyncSpotNotifier extends AsyncNotifier<List<SpotMarketItem>> {
  Future<List<SpotMarketItem>> _fetch() async {
    final ret = await SpotApi.getSpotMarket();

    return ret?.data?.list ?? [];
  }

  @override
  Future<List<SpotMarketItem>> build() async {
    return _fetch();
  }

  Future<void> load() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      CToast.loading();
      var ret = await _fetch();
      CToast.success('成功');
      return ret;
    });
  }
}

final spotProvider =
    AsyncNotifierProvider<AsyncSpotNotifier, List<SpotMarketItem>>(
        () => AsyncSpotNotifier());

final usdtMarketProvider = FutureProvider<List<SpotMarketItem>>((ref) async {
  List<SpotMarketItem> allMarkets = await ref.watch(spotProvider.future);
  return allMarkets.where((item) {
    return item.market != null ? item.market!.endsWith('USDT') : false;
  }).toList();
});
