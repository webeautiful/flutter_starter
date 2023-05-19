import 'package:flutter_starter/models/spot_market_entity.dart';

List<SpotMarketItem> spotMarketList = List.generate(1, (index) {
  final item = SpotMarketItem();
  item.marketId = 1;
  item.platform = 'match';
  item.tag = '';
  item.marketName = 'BTC/USDT';
  item.market = 'BTCUSDT';
  item.stock = 'stock';
  item.money = 'money';
  item.stockPrecision = 8;
  item.moneyPrecision = 8;
  item.pricePrecision = 8;
  item.minPrice = '0.010000000000000000';
  item.maxPrice = '1000000.000000000000000000';
  item.tickSize = '0.010000000000000000';
  item.minQty = '0.000001000000000000';
  item.maxQty = '9000.000000000000000000';
  item.stepSize = '0.000001000000000000';
  item.minNotional = '0.100000000000000000';
  item.price = '26851.580000000000000000';
  item.makerFee = 0.002;
  item.takerFee = 0.002;
  item.tradeStatus = 1;
  item.openTime = 1666611568;
  item.icon =
      'https://api.bidacoin.co/storage/avatars/20221008/8862850ad8ec4111dadcb2122da09906.png';
  item.name = 'Bitcoin';
  final tickerData = SpotMarketTickerData();
  tickerData.open = '26823.08';
  tickerData.high = '26958.44';
  tickerData.low = '26747.67';
  tickerData.last = '26851.58000000';
  tickerData.volume = '0.56248';
  tickerData.quoteVolume = '15179.15252008';
  tickerData.priceChangePercent = 0;
  item.tickerData = tickerData;
  return item;
});

final spotMarketMock = SpotMarketEntity()
  ..count = 1
  ..list = spotMarketList;
