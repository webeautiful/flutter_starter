import 'package:flutter_starter/generated/json/base/json_field.dart';
import 'package:flutter_starter/models/api_response_entity.g.dart';
import 'dart:convert';

class ApiResponseEntity<T> {
	int? code;
	String? msg;
	T? data;

	ApiResponseEntity();

	factory ApiResponseEntity.fromJson(Map<String, dynamic> json) => $ApiResponseEntityFromJson<T>(json);

	Map<String, dynamic> toJson() => $ApiResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}