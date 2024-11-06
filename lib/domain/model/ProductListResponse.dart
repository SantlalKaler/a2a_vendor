import 'dart:convert';

import 'CatSubCatResponse.dart';
ProductListResponse productListResponseFromJson(String str) => ProductListResponse.fromJson(json.decode(str));
String productListResponseToJson(ProductListResponse data) => json.encode(data.toJson());
class ProductListResponse {
  ProductListResponse({
      String? status, 
      List<Product>? products,
      num? totalCount,}){
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
ProductListResponse copyWith({  String? status,
  List<Product>? products,
  num? totalCount,
}) => ProductListResponse(  status: status ?? _status,
  products: products ?? _products,
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

Product resultFromJson(String str) => Product.fromJson(json.decode(str));
String resultToJson(Product data) => json.encode(data.toJson());
class Product {
  Product({
      String? shop,
    CatSubCat? category,
    CatSubCat? subCategory,
      String? name, 
      String? weight, 
      String? description, 
      num? active, 
      num? deleted, 
      String? sellingPrice, 
      String? discountedPrice, 
      String? image, 
      String? sku, 
      String? length, 
      String? width, 
      String? height, 
      String? id, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _shop = shop;
    _category = category;
    _subCategory = subCategory;
    _name = name;
    _weight = weight;
    _description = description;
    _active = active;
    _deleted = deleted;
    _sellingPrice = sellingPrice;
    _discountedPrice = discountedPrice;
    _image = image;
    _sku = sku;
    _length = length;
    _width = width;
    _height = height;
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  Product.fromJson(dynamic json) {
    _shop = json['shop'];
    _category = json['category'] != null ? CatSubCat.fromJson(json['category']) : null;
    _subCategory = json['sub_category'] != null ? CatSubCat.fromJson(json['sub_category']) : null;
    _name = json['name'];
    _weight = json['weight'];
    _description = json['description'];
    _active = json['active'];
    _deleted = json['deleted'];
    _sellingPrice = json['selling_price'];
    _discountedPrice = json['discounted_price'];
    _image = json['image'];
    _sku = json['sku'];
    _length = json['length'];
    _width = json['width'];
    _height = json['height'];
    _id = json['_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _shop;
  CatSubCat? _category;
  CatSubCat? _subCategory;
  String? _name;
  String? _weight;
  String? _description;
  num? _active;
  num? _deleted;
  String? _sellingPrice;
  String? _discountedPrice;
  String? _image;
  String? _sku;
  String? _length;
  String? _width;
  String? _height;
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
Product copyWith({  String? shop,
  CatSubCat? category,
  CatSubCat? subCategory,
  String? name,
  String? weight,
  String? description,
  num? active,
  num? deleted,
  String? sellingPrice,
  String? discountedPrice,
  String? image,
  String? sku,
  String? length,
  String? width,
  String? height,
  String? id,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => Product(  shop: shop ?? _shop,
  category: category ?? _category,
  subCategory: subCategory ?? _subCategory,
  name: name ?? _name,
  weight: weight ?? _weight,
  description: description ?? _description,
  active: active ?? _active,
  deleted: deleted ?? _deleted,
  sellingPrice: sellingPrice ?? _sellingPrice,
  discountedPrice: discountedPrice ?? _discountedPrice,
  image: image ?? _image,
  sku: sku ?? _sku,
  length: length ?? _length,
  width: width ?? _width,
  height: height ?? _height,
  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
);
  String? get shop => _shop;
  CatSubCat? get category => _category;
  CatSubCat? get subCategory => _subCategory;
  String? get name => _name;
  String? get weight => _weight;
  String? get description => _description;
  num? get active => _active;
  num? get deleted => _deleted;
  String? get sellingPrice => _sellingPrice;
  String? get discountedPrice => _discountedPrice;
  String? get image => _image;
  String? get sku => _sku;
  String? get length => _length;
  String? get width => _width;
  String? get height => _height;
  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['shop'] = _shop;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    if (_subCategory != null) {
      map['sub_category'] = _subCategory?.toJson();
    }
    map['name'] = _name;
    map['weight'] = _weight;
    map['description'] = _description;
    map['active'] = _active;
    map['deleted'] = _deleted;
    map['selling_price'] = _sellingPrice;
    map['discounted_price'] = _discountedPrice;
    map['image'] = _image;
    map['sku'] = _sku;
    map['length'] = _length;
    map['width'] = _width;
    map['height'] = _height;
    map['_id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}
