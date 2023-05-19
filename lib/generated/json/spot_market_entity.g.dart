import 'package:flutter_starter/generated/json/base/json_convert_content.dart';
import 'package:flutter_starter/models/spot_market_entity.dart';

SpotMarketEntity $SpotMarketEntityFromJson(Map<String, dynamic> json) {
	final SpotMarketEntity spotMarketEntity = SpotMarketEntity();
	final int? count = jsonConvert.convert<int>(json['count']);
	if (count != null) {
		spotMarketEntity.count = count;
	}
	final List<SpotMarketItem>? list = jsonConvert.convertListNotNull<SpotMarketItem>(json['list']);
	if (list != null) {
		spotMarketEntity.list = list;
	}
	return spotMarketEntity;
}

Map<String, dynamic> $SpotMarketEntityToJson(SpotMarketEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['count'] = entity.count;
	data['list'] =  entity.list?.map((v) => v.toJson()).toList();
	return data;
}

SpotMarketItem $SpotMarketItemFromJson(Map<String, dynamic> json) {
	final SpotMarketItem spotMarketItem = SpotMarketItem();
	final int? marketId = jsonConvert.convert<int>(json['market_id']);
	if (marketId != null) {
		spotMarketItem.marketId = marketId;
	}
	final String? platform = jsonConvert.convert<String>(json['platform']);
	if (platform != null) {
		spotMarketItem.platform = platform;
	}
	final String? tag = jsonConvert.convert<String>(json['tag']);
	if (tag != null) {
		spotMarketItem.tag = tag;
	}
	final String? marketName = jsonConvert.convert<String>(json['market_name']);
	if (marketName != null) {
		spotMarketItem.marketName = marketName;
	}
	final String? market = jsonConvert.convert<String>(json['market']);
	if (market != null) {
		spotMarketItem.market = market;
	}
	final String? stock = jsonConvert.convert<String>(json['stock']);
	if (stock != null) {
		spotMarketItem.stock = stock;
	}
	final String? money = jsonConvert.convert<String>(json['money']);
	if (money != null) {
		spotMarketItem.money = money;
	}
	final int? stockPrecision = jsonConvert.convert<int>(json['stockPrecision']);
	if (stockPrecision != null) {
		spotMarketItem.stockPrecision = stockPrecision;
	}
	final int? moneyPrecision = jsonConvert.convert<int>(json['moneyPrecision']);
	if (moneyPrecision != null) {
		spotMarketItem.moneyPrecision = moneyPrecision;
	}
	final int? pricePrecision = jsonConvert.convert<int>(json['pricePrecision']);
	if (pricePrecision != null) {
		spotMarketItem.pricePrecision = pricePrecision;
	}
	final String? minPrice = jsonConvert.convert<String>(json['minPrice']);
	if (minPrice != null) {
		spotMarketItem.minPrice = minPrice;
	}
	final String? maxPrice = jsonConvert.convert<String>(json['maxPrice']);
	if (maxPrice != null) {
		spotMarketItem.maxPrice = maxPrice;
	}
	final String? tickSize = jsonConvert.convert<String>(json['tickSize']);
	if (tickSize != null) {
		spotMarketItem.tickSize = tickSize;
	}
	final String? minQty = jsonConvert.convert<String>(json['minQty']);
	if (minQty != null) {
		spotMarketItem.minQty = minQty;
	}
	final String? maxQty = jsonConvert.convert<String>(json['maxQty']);
	if (maxQty != null) {
		spotMarketItem.maxQty = maxQty;
	}
	final String? stepSize = jsonConvert.convert<String>(json['stepSize']);
	if (stepSize != null) {
		spotMarketItem.stepSize = stepSize;
	}
	final String? minNotional = jsonConvert.convert<String>(json['minNotional']);
	if (minNotional != null) {
		spotMarketItem.minNotional = minNotional;
	}
	final String? price = jsonConvert.convert<String>(json['price']);
	if (price != null) {
		spotMarketItem.price = price;
	}
	final double? makerFee = jsonConvert.convert<double>(json['maker_fee']);
	if (makerFee != null) {
		spotMarketItem.makerFee = makerFee;
	}
	final double? takerFee = jsonConvert.convert<double>(json['taker_fee']);
	if (takerFee != null) {
		spotMarketItem.takerFee = takerFee;
	}
	final int? tradeStatus = jsonConvert.convert<int>(json['tradeStatus']);
	if (tradeStatus != null) {
		spotMarketItem.tradeStatus = tradeStatus;
	}
	final int? openTime = jsonConvert.convert<int>(json['open_time']);
	if (openTime != null) {
		spotMarketItem.openTime = openTime;
	}
	final SpotMarketTickerData? tickerData = jsonConvert.convert<SpotMarketTickerData>(json['tickerData']);
	if (tickerData != null) {
		spotMarketItem.tickerData = tickerData;
	}
	final String? icon = jsonConvert.convert<String>(json['icon']);
	if (icon != null) {
		spotMarketItem.icon = icon;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		spotMarketItem.name = name;
	}
	return spotMarketItem;
}

Map<String, dynamic> $SpotMarketItemToJson(SpotMarketItem entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['market_id'] = entity.marketId;
	data['platform'] = entity.platform;
	data['tag'] = entity.tag;
	data['market_name'] = entity.marketName;
	data['market'] = entity.market;
	data['stock'] = entity.stock;
	data['money'] = entity.money;
	data['stockPrecision'] = entity.stockPrecision;
	data['moneyPrecision'] = entity.moneyPrecision;
	data['pricePrecision'] = entity.pricePrecision;
	data['minPrice'] = entity.minPrice;
	data['maxPrice'] = entity.maxPrice;
	data['tickSize'] = entity.tickSize;
	data['minQty'] = entity.minQty;
	data['maxQty'] = entity.maxQty;
	data['stepSize'] = entity.stepSize;
	data['minNotional'] = entity.minNotional;
	data['price'] = entity.price;
	data['maker_fee'] = entity.makerFee;
	data['taker_fee'] = entity.takerFee;
	data['tradeStatus'] = entity.tradeStatus;
	data['open_time'] = entity.openTime;
	data['tickerData'] = entity.tickerData?.toJson();
	data['icon'] = entity.icon;
	data['name'] = entity.name;
	return data;
}

SpotMarketTickerData $SpotMarketTickerDataFromJson(Map<String, dynamic> json) {
	final SpotMarketTickerData spotMarketTickerData = SpotMarketTickerData();
	final String? last = jsonConvert.convert<String>(json['last']);
	if (last != null) {
		spotMarketTickerData.last = last;
	}
	final String? open = jsonConvert.convert<String>(json['open']);
	if (open != null) {
		spotMarketTickerData.open = open;
	}
	final String? high = jsonConvert.convert<String>(json['high']);
	if (high != null) {
		spotMarketTickerData.high = high;
	}
	final String? low = jsonConvert.convert<String>(json['low']);
	if (low != null) {
		spotMarketTickerData.low = low;
	}
	final String? volume = jsonConvert.convert<String>(json['volume']);
	if (volume != null) {
		spotMarketTickerData.volume = volume;
	}
	final String? quoteVolume = jsonConvert.convert<String>(json['quoteVolume']);
	if (quoteVolume != null) {
		spotMarketTickerData.quoteVolume = quoteVolume;
	}
	final int? priceChangePercent = jsonConvert.convert<int>(json['priceChangePercent']);
	if (priceChangePercent != null) {
		spotMarketTickerData.priceChangePercent = priceChangePercent;
	}
	return spotMarketTickerData;
}

Map<String, dynamic> $SpotMarketTickerDataToJson(SpotMarketTickerData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['last'] = entity.last;
	data['open'] = entity.open;
	data['high'] = entity.high;
	data['low'] = entity.low;
	data['volume'] = entity.volume;
	data['quoteVolume'] = entity.quoteVolume;
	data['priceChangePercent'] = entity.priceChangePercent;
	return data;
}