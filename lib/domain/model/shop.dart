import 'dart:convert';

import 'package:a2a_vendor/domain/model/position.dart';

import 'bank_details.dart';
import 'banner.dart';
import 'fssi.dart';
import 'menu.dart';

Shop shopFromJson(String str) => Shop.fromJson(json.decode(str));
String shopToJson(Shop data) => json.encode(data.toJson());
class Shop {
  Shop({
    Position? position,
    BankDetails? bankDetails,
    String? shopName,
    String? shopDescription,
    String? fullName,
    String? mobile,
    String? email,
    String? address,
    String? address2,
    String? landmark,
    String? country,
    String? postOffice,
    String? pincode,
    List<Menu>? menu,
    List<Banner>? banner,
    List<Fssi>? fssi,
    String? upiId,
    String? qrCode,
    num? deleted,
    num? active,
    String? addedBy,
    String? otp,
    String? deviceToken,
    String? deviceType,
    String? mobile2,
    String? mobile3,
    String? dish1,
    String? dish2,
    String? dish3,
    String? detail1,
    String? detail2,
    String? detail3,
    String? id,
    String? state,
    String? city,
    String? createdAt,
    String? updatedAt,
    num? v,}){
    _position = position;
    _bankDetails = bankDetails;
    _shopName = shopName;
    _shopDescription = shopDescription;
    _fullName = fullName;
    _mobile = mobile;
    _email = email;
    _address = address;
    _address2 = address2;
    _landmark = landmark;
    _country = country;
    _postOffice = postOffice;
    _pincode = pincode;
    _menu = menu;
    _banner = banner;
    _fssi = fssi;
    _upiId = upiId;
    _qrCode = qrCode;
    _deleted = deleted;
    _active = active;
    _addedBy = addedBy;
    _otp = otp;
    _deviceToken = deviceToken;
    _deviceType = deviceType;
    _mobile2 = mobile2;
    _mobile3 = mobile3;
    _dish1 = dish1;
    _dish2 = dish2;
    _dish3 = dish3;
    _detail1 = detail1;
    _detail2 = detail2;
    _detail3 = detail3;
    _id = id;
    _state = state;
    _city = city;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  Shop.fromJson(dynamic json) {
    _position = json['position'] != null ? Position.fromJson(json['position']) : null;
    _bankDetails = json['bank_details'] != null ? BankDetails.fromJson(json['bank_details']) : null;
    _shopName = json['shop_name'];
    _shopDescription = json['shop_description'];
    _fullName = json['full_name'];
    _mobile = json['mobile'];
    _email = json['email'];
    _address = json['address'];
    _address2 = json['address2'];
    _landmark = json['landmark'];
    _country = json['country'];
    _postOffice = json['post_office'];
    _pincode = json['pincode'];
    if (json['menu'] != null) {
      _menu = [];
      json['menu'].forEach((v) {
        _menu?.add(Menu.fromJson(v));
      });
    }
    if (json['banner'] != null) {
      _banner = [];
      json['banner'].forEach((v) {
        _banner?.add(Banner.fromJson(v));
      });
    }
    if (json['fssi'] != null) {
      _fssi = [];
      json['fssi'].forEach((v) {
        _fssi?.add(Fssi.fromJson(v));
      });
    }
    _upiId = json['upi_id'];
    _qrCode = json['qr_code'];
    _deleted = json['deleted'];
    _active = json['active'];
    _addedBy = json['added_by'];
    _otp = json['otp'];
    _deviceToken = json['device_token'];
    _deviceType = json['device_type'];
    _mobile2 = json['mobile2'];
    _mobile3 = json['mobile3'];
    _dish1 = json['dish1'];
    _dish2 = json['dish2'];
    _dish3 = json['dish3'];
    _detail1 = json['detail1'];
    _detail2 = json['detail2'];
    _detail3 = json['detail3'];
    _id = json['_id'];
    _state = json['state'];
    _city = json['city'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  Position? _position;
  BankDetails? _bankDetails;
  String? _shopName;
  String? _shopDescription;
  String? _fullName;
  String? _mobile;
  String? _email;
  String? _address;
  String? _address2;
  String? _landmark;
  String? _country;
  String? _postOffice;
  String? _pincode;
  List<Menu>? _menu;
  List<Banner>? _banner;
  List<Fssi>? _fssi;
  String? _upiId;
  String? _qrCode;
  num? _deleted;
  num? _active;
  String? _addedBy;
  String? _otp;
  String? _deviceToken;
  String? _deviceType;
  String? _mobile2;
  String? _mobile3;
  String? _dish1;
  String? _dish2;
  String? _dish3;
  String? _detail1;
  String? _detail2;
  String? _detail3;
  String? _id;
  String? _state;
  String? _city;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  Shop copyWith({  Position? position,
    BankDetails? bankDetails,
    String? shopName,
    String? shopDescription,
    String? fullName,
    String? mobile,
    String? email,
    String? address,
    String? address2,
    String? landmark,
    String? country,
    String? postOffice,
    String? pincode,
    List<Menu>? menu,
    List<Banner>? banner,
    List<Fssi>? fssi,
    String? upiId,
    String? qrCode,
    num? deleted,
    num? active,
    String? addedBy,
    String? otp,
    String? deviceToken,
    String? deviceType,
    String? mobile2,
    String? mobile3,
    String? dish1,
    String? dish2,
    String? dish3,
    String? detail1,
    String? detail2,
    String? detail3,
    String? id,
    String? state,
    String? city,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) => Shop(  position: position ?? _position,
    bankDetails: bankDetails ?? _bankDetails,
    shopName: shopName ?? _shopName,
    shopDescription: shopDescription ?? _shopDescription,
    fullName: fullName ?? _fullName,
    mobile: mobile ?? _mobile,
    email: email ?? _email,
    address: address ?? _address,
    address2: address2 ?? _address2,
    landmark: landmark ?? _landmark,
    country: country ?? _country,
    postOffice: postOffice ?? _postOffice,
    pincode: pincode ?? _pincode,
    menu: menu ?? _menu,
    banner: banner ?? _banner,
    fssi: fssi ?? _fssi,
    upiId: upiId ?? _upiId,
    qrCode: qrCode ?? _qrCode,
    deleted: deleted ?? _deleted,
    active: active ?? _active,
    addedBy: addedBy ?? _addedBy,
    otp: otp ?? _otp,
    deviceToken: deviceToken ?? _deviceToken,
    deviceType: deviceType ?? _deviceType,
    mobile2: mobile2 ?? _mobile2,
    mobile3: mobile3 ?? _mobile3,
    dish1: dish1 ?? _dish1,
    dish2: dish2 ?? _dish2,
    dish3: dish3 ?? _dish3,
    detail1: detail1 ?? _detail1,
    detail2: detail2 ?? _detail2,
    detail3: detail3 ?? _detail3,
    id: id ?? _id,
    state: state ?? _state,
    city: city ?? _city,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
    v: v ?? _v,
  );
  Position? get position => _position;
  BankDetails? get bankDetails => _bankDetails;
  String? get shopName => _shopName;
  String? get shopDescription => _shopDescription;
  String? get fullName => _fullName;
  String? get mobile => _mobile;
  String? get email => _email;
  String? get address => _address;
  String? get address2 => _address2;
  String? get landmark => _landmark;
  String? get country => _country;
  String? get postOffice => _postOffice;
  String? get pincode => _pincode;
  List<Menu>? get menu => _menu;
  List<Banner>? get banner => _banner;
  List<Fssi>? get fssi => _fssi;
  String? get upiId => _upiId;
  String? get qrCode => _qrCode;
  num? get deleted => _deleted;
  num? get active => _active;
  String? get addedBy => _addedBy;
  String? get otp => _otp;
  String? get deviceToken => _deviceToken;
  String? get deviceType => _deviceType;
  String? get mobile2 => _mobile2;
  String? get mobile3 => _mobile3;
  String? get dish1 => _dish1;
  String? get dish2 => _dish2;
  String? get dish3 => _dish3;
  String? get detail1 => _detail1;
  String? get detail2 => _detail2;
  String? get detail3 => _detail3;
  String? get id => _id;
  String? get state => _state;
  String? get city => _city;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_position != null) {
      map['position'] = _position?.toJson();
    }
    if (_bankDetails != null) {
      map['bank_details'] = _bankDetails?.toJson();
    }
    map['shop_name'] = _shopName;
    map['shop_description'] = _shopDescription;
    map['full_name'] = _fullName;
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['address'] = _address;
    map['address2'] = _address2;
    map['landmark'] = _landmark;
    map['country'] = _country;
    map['post_office'] = _postOffice;
    map['pincode'] = _pincode;
    if (_menu != null) {
      map['menu'] = _menu?.map((v) => v.toJson()).toList();
    }
    if (_banner != null) {
      map['banner'] = _banner?.map((v) => v.toJson()).toList();
    }
    if (_fssi != null) {
      map['fssi'] = _fssi?.map((v) => v.toJson()).toList();
    }
    map['upi_id'] = _upiId;
    map['qr_code'] = _qrCode;
    map['deleted'] = _deleted;
    map['active'] = _active;
    map['added_by'] = _addedBy;
    map['otp'] = _otp;
    map['device_token'] = _deviceToken;
    map['device_type'] = _deviceType;
    map['mobile2'] = _mobile2;
    map['mobile3'] = _mobile3;
    map['dish1'] = _dish1;
    map['dish2'] = _dish2;
    map['dish3'] = _dish3;
    map['detail1'] = _detail1;
    map['detail2'] = _detail2;
    map['detail3'] = _detail3;
    map['_id'] = _id;
    map['state'] = _state;
    map['city'] = _city;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}