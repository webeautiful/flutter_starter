import 'package:flutter/foundation.dart';
import 'package:flutter_starter/generated/json/base/json_convert_content.dart';
import 'package:flutter_starter/models/api_response_entity.dart';

ApiResponseEntity<T> $ApiResponseEntityFromJson<T>(Map<String, dynamic> json) {
	final ApiResponseEntity<T> apiResponseEntity = ApiResponseEntity<T>();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		apiResponseEntity.code = code;
	}
	final String? msg = jsonConvert.convert<String>(json['msg']);
	if (msg != null) {
		apiResponseEntity.msg = msg;
	}
	apiResponseEntity.data = json['data'] ?? JsonConvert.fromJsonAsT<T>(json['data']);
	return apiResponseEntity;
}

Map<String, dynamic> $ApiResponseEntityToJson(ApiResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] = entity.data;
	return data;
}