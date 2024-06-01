import 'dart:convert';

import 'package:a2a_vendor/domain/model/CatSubCatResponse.dart';

ProductListResponse productListResponseFromJson(String str) =>
    ProductListResponse.fromJson(json.decode(str));

String productListResponseToJson(ProductListResponse data) =>
    json.encode(data.toJson());

class ProductListResponse {
  ProductListResponse({
    String? status,
    List<Product>? products,
    num? totalCount,
  }) {
    _status = status;
    _products = products;
    _totalCount = totalCount;
  }

  ProductListResponse.fromJson(dynamic json) {
    _status = json['status'];
    if (json['result'] != null) {
      _products = [];
      json['result'].forEach((v) {
        _products?.add(Product.fromJson(v));
      });
    }
    _totalCount = json['totalCount'];
  }

  String? _status;
  List<Product>? _products;
  num? _totalCount;

  ProductListResponse copyWith({
    String? status,
    List<Product>? result,
    num? totalCount,
  }) =>
      ProductListResponse(
        status: status ?? _status,
        products: result ?? _products,
        totalCount: totalCount ?? _totalCount,
      );

  String? get status => _status;

  List<Product>? get products => _products;

  num? get totalCount => _totalCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_products != null) {
      map['result'] = _products?.map((v) => v.toJson()).toList();
    }
    map['totalCount'] = _totalCount;
    return map;
  }
}

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    String? shop,
    String? name,
    String? weight,
    String? description,
    CatSubCat? category,
    CatSubCat? subCategory,
    num? active,
    num? deleted,
    String? id,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) {
    _shop = shop;
    _name = name;
    _category = category;
    _subCategory = subCategory;
    _weight = weight;
    _description = description;
    _active = active;
    _deleted = deleted;
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  Product.fromJson(dynamic json) {
    _shop = json['shop'];
    _name = json['name'];
    _category =
        json['category'] != null ? CatSubCat.fromJson(json['category']) : null;
    _subCategory = json['sub_category'] != null
        ? CatSubCat.fromJson(json['sub_category'])
        : null;
    _weight = json['weight'];
    _description = json['description'];
    _active = json['active'];
    _deleted = json['deleted'];
    _id = json['_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }

  String? _shop;
  String? _name;
  String? _weight;
  String? _description;
  CatSubCat? _category;
  CatSubCat? _subCategory;
  num? _active;
  num? _deleted;
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  Product copyWith({
    String? shop,
    String? name,
    String? weight,
    String? description,
    CatSubCat? category,
    CatSubCat? subCategory,
    num? active,
    num? deleted,
    String? id,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) =>
      Product(
        shop: shop ?? _shop,
        name: name ?? _name,
        category: category ?? _category,
        subCategory: subCategory ?? _subCategory,
        weight: weight ?? _weight,
        description: description ?? _description,
        active: active ?? _active,
        deleted: deleted ?? _deleted,
        id: id ?? _id,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
      );

  String? get shop => _shop;

  String? get name => _name;

  String? get weight => _weight;

  String? get description => _description;

  num? get active => _active;

  CatSubCat? get category => _category;

  CatSubCat? get subCategory => _subCategory;

  num? get deleted => _deleted;

  String? get id => _id;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['shop'] = _shop;
    map['name'] = _name;
    map['weight'] = _weight;
    map['category'] = _category;
    map['description'] = _description;
    map['active'] = _active;
    map['deleted'] = _deleted;
    map['_id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}
