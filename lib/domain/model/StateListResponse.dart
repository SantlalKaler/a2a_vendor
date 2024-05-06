import 'dart:convert';

import 'package:t2p_vendor/domain/model/state.dart';
StateListResponse stateListResponseFromJson(String str) => StateListResponse.fromJson(json.decode(str));
String stateListResponseToJson(StateListResponse data) => json.encode(data.toJson());
class StateListResponse {
  StateListResponse({
      String? status, 
      List<IndState>? result,}){
    _status = status;
    _result = result;
}

  StateListResponse.fromJson(dynamic json) {
    _status = json['status'];
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(IndState.fromJson(v));
      });
    }
  }
  String? _status;
  List<IndState>? _result;
StateListResponse copyWith({  String? status,
  List<IndState>? result,
}) => StateListResponse(  status: status ?? _status,
  result: result ?? _result,
);
  String? get status => _status;
  List<IndState>? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
