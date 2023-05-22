import 'package:flutter_starter/api/api_path.dart';
import 'package:flutter_starter/api/http_util.dart';
import 'package:flutter_starter/models/api_response_entity.dart';
import 'package:flutter_starter/models/spot_market_entity.dart';

class SpotApi {
  static Future<ApiResponseEntity<SpotMarketEntity>?> getSpotMarket() async {
    return httpUtil.get(ApiPath.spotMarket);
  }
}
