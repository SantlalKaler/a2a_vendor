import 'dart:convert';

import 'package:a2a_vendor/domain/model/shop.dart';
LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));
String loginResponseToJson(LoginResponse shop) => json.encode(shop.toJson());
class LoginResponse {
  LoginResponse({
      String? status, 
      Shop? shop,
      String? message,}){
    _status = status;
    _shop = shop;
    _message = message;
}

  LoginResponse.fromJson(dynamic json) {
    _status = json['status'];
    _shop = json['data'] != null ? Shop.fromJson(json['data']) : null;
    _message = json['message'];
  }
  String? _status;
  Shop? _shop;
  String? _message;
LoginResponse copyWith({  String? status,
  Shop? shop,
  String? message,
}) => LoginResponse(  status: status ?? _status,
  shop: shop ?? _shop,
  message: message ?? _message,
);
  String? get status => _status;
  Shop? get shop => _shop;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_shop != null) {
      map['data'] = _shop?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}



