import 'dart:convert';

import 'city.dart';

IndState indStateFromJson(String str) => IndState.fromJson(json.decode(str));

String indStateTsoJson(IndState data) => json.encode(data.toJson());

class IndState {
  IndState({
    String? id,
    num? active,
    String? name,
    num? deleted,
    List<City>? city,
  }) {
    _id = id;
    _active = active;
    _name = name;
    _deleted = deleted;
    _city = city;
  }

  IndState.fromJson(dynamic json) {
    _id = json['_id'];
    _active = json['active'];
    _name = json['name'];
    _deleted = json['deleted'];
    if (json['city'] != null) {
      _city = [];
      json['city'].forEach((v) {
        _city?.add(City.fromJson(v));
      });
    }
  }

  String? _id;
  num? _active;
  String? _name;
  num? _deleted;
  List<City>? _city;

  IndState copyWith({
    String? id,
    num? active,
    String? name,
    num? deleted,
    List<City>? city,
  }) =>
      IndState(
        id: id ?? _id,
        active: active ?? _active,
        name: name ?? _name,
        deleted: deleted ?? _deleted,
        city: city ?? _city,
      );

  String? get id => _id;

  num? get active => _active;

  String? get name => _name;

  num? get deleted => _deleted;

  List<City>? get city => _city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['active'] = _active;
    map['name'] = _name;
    map['deleted'] = _deleted;
    if (_city != null) {
      map['city'] = _city?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
