import 'package:flutter_starter/generated/json/base/json_field.dart';
import 'package:flutter_starter/generated/json/spot_market_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class SpotMarketEntity {
  int? count;
  List<SpotMarketItem>? list;

  SpotMarketEntity();

  factory SpotMarketEntity.fromJson(Map<String, dynamic> json) =>
      $SpotMarketEntityFromJson(json);

  Map<String, dynamic> toJson() => $SpotMarketEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SpotMarketItem {
  @JSONField(name: "market_id")
  int? marketId;
  String? platform;
  String? tag;
  @JSONField(name: "market_name")
  String? marketName;
  String? market;
  String? stock;
  String? money;
  int? stockPrecision;
  int? moneyPrecision;
  int? pricePrecision;
  String? minPrice;
  String? maxPrice;
  String? tickSize;
  String? minQty;
  String? maxQty;
  String? stepSize;
  String? minNotional;
  String? price;
  @JSONField(name: "maker_fee")
  double? makerFee;
  @JSONField(name: "taker_fee")
  double? takerFee;
  int? tradeStatus;
  @JSONField(name: "open_time")
  int? openTime;
  SpotMarketTickerData? tickerData;
  String? icon;
  String? name;

  SpotMarketItem();

  factory SpotMarketItem.fromJson(Map<String, dynamic> json) =>
      $SpotMarketItemFromJson(json);

  Map<String, dynamic> toJson() => $SpotMarketItemToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SpotMarketTickerData {
  String? last;
  String? open;
  String? high;
  String? low;
  String? volume;
  String? quoteVolume;
  int? priceChangePercent;

  SpotMarketTickerData();

  factory SpotMarketTickerData.fromJson(Map<String, dynamic> json) =>
      $SpotMarketTickerDataFromJson(json);

  Map<String, dynamic> toJson() => $SpotMarketTickerDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
