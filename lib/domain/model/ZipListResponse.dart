import 'dart:convert';
ZipListResponse zipListResponseFromJson(String str) => ZipListResponse.fromJson(json.decode(str));
String zipListResponseToJson(ZipListResponse data) => json.encode(data.toJson());
class ZipListResponse {
  ZipListResponse({
      String? status, 
      List<Zip>? zipList,}){
    _status = status;
    _zipList = zipList;
}

  ZipListResponse.fromJson(dynamic json) {
    _status = json['status'];
    if (json['result'] != null) {
      _zipList = [];
      json['result'].forEach((v) {
        _zipList?.add(Zip.fromJson(v));
      });
    }
  }
  String? _status;
  List<Zip>? _zipList;
ZipListResponse copyWith({  String? status,
  List<Zip>? zipList,
}) => ZipListResponse(  status: status ?? _status,
  zipList: zipList ?? _zipList,
);
  String? get status => _status;
  List<Zip>? get zipList => _zipList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_zipList != null) {
      map['result'] = _zipList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Zip zipFromJson(String str) => Zip.fromJson(json.decode(str));
String zipToJson(Zip data) => json.encode(data.toJson());
class Zip {
  Zip({
      String? name, 
      String? timeslot, 
      String? additionalCost,
      String? updateDate, 
      num? active, 
      num? deleted, 
      bool? cod, 
      bool? expressCod, 
      bool? express, 
      String? id, 
      String? city, 
      String? createdDate, 
      num? v,}){
    _name = name;
    _timeslot = timeslot;
    _additionalCost = additionalCost;
    _updateDate = updateDate;
    _active = active;
    _deleted = deleted;
    _cod = cod;
    _expressCod = expressCod;
    _express = express;
    _id = id;
    _city = city;
    _createdDate = createdDate;
    _v = v;
}

  Zip.fromJson(dynamic json) {
    _name = json['name'];
    _timeslot = json['timeslot'];
    _additionalCost = json['additional_cost'].toString();
    _updateDate = json['update_date'];
    _active = json['active'];
    _deleted = json['deleted'];
    _cod = json['cod'];
    _expressCod = json['express_cod'];
    _express = json['express'];
    _id = json['_id'];
    _city = json['city'];
    _createdDate = json['created_date'];
    _v = json['__v'];
  }
  String? _name;
  String? _timeslot;
  String? _additionalCost;
  String? _updateDate;
  num? _active;
  num? _deleted;
  bool? _cod;
  bool? _expressCod;
  bool? _express;
  String? _id;
  String? _city;
  String? _createdDate;
  num? _v;
Zip copyWith({  String? name,
  String? timeslot,
  String? additionalCost,
  String? updateDate,
  num? active,
  num? deleted,
  bool? cod,
  bool? expressCod,
  bool? express,
  String? id,
  String? city,
  String? createdDate,
  num? v,
}) => Zip(  name: name ?? _name,
  timeslot: timeslot ?? _timeslot,
  additionalCost: additionalCost ?? _additionalCost,
  updateDate: updateDate ?? _updateDate,
  active: active ?? _active,
  deleted: deleted ?? _deleted,
  cod: cod ?? _cod,
  expressCod: expressCod ?? _expressCod,
  express: express ?? _express,
  id: id ?? _id,
  city: city ?? _city,
  createdDate: createdDate ?? _createdDate,
  v: v ?? _v,
);
  String? get name => _name;
  String? get timeslot => _timeslot;
  String? get additionalCost => _additionalCost;
  String? get updateDate => _updateDate;
  num? get active => _active;
  num? get deleted => _deleted;
  bool? get cod => _cod;
  bool? get expressCod => _expressCod;
  bool? get express => _express;
  String? get id => _id;
  String? get city => _city;
  String? get createdDate => _createdDate;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['timeslot'] = _timeslot;
    map['additional_cost'] = _additionalCost;
    map['update_date'] = _updateDate;
    map['active'] = _active;
    map['deleted'] = _deleted;
    map['cod'] = _cod;
    map['express_cod'] = _expressCod;
    map['express'] = _express;
    map['_id'] = _id;
    map['city'] = _city;
    map['created_date'] = _createdDate;
    map['__v'] = _v;
    return map;
  }

}