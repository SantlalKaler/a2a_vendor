import 'dart:convert';
CatSubCatResponse catSubCatResponseFromJson(String str) => CatSubCatResponse.fromJson(json.decode(str));
String catSubCatResponseToJson(CatSubCatResponse data) => json.encode(data.toJson());
class CatSubCatResponse {
  CatSubCatResponse({
      String? status, 
      List<CatSubCat>? catSubCats,
      num? totalCount,}){
    _status = status;
    _catSubCats = catSubCats;
    _totalCount = totalCount;
}

  CatSubCatResponse.fromJson(dynamic json) {
    _status = json['status'];
    if (json['result'] != null) {
      _catSubCats = [];
      json['result'].forEach((v) {
        _catSubCats?.add(CatSubCat.fromJson(v));
      });
    }
    _totalCount = json['totalCount'];
  }
  String? _status;
  List<CatSubCat>? _catSubCats;
  num? _totalCount;
CatSubCatResponse copyWith({  String? status,
  List<CatSubCat>? result,
  num? totalCount,
}) => CatSubCatResponse(  status: status ?? _status,
  catSubCats: result ?? _catSubCats,
  totalCount: totalCount ?? _totalCount,
);
  String? get status => _status;
  List<CatSubCat>? get catSubCats => _catSubCats;
  num? get totalCount => _totalCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_catSubCats != null) {
      map['result'] = _catSubCats?.map((v) => v.toJson()).toList();
    }
    map['totalCount'] = _totalCount;
    return map;
  }

}

CatSubCat resultFromJson(String str) => CatSubCat.fromJson(json.decode(str));
String resultToJson(CatSubCat data) => json.encode(data.toJson());
class CatSubCat {
  CatSubCat({
      String? name, 
      String? description, 
      String? descriptionAfterContent, 
      Parent? parent, 
      String? file, 
      String? createdDate, 
      String? updateDate, 
      num? active, 
      num? deleted, 
      String? seoTitle, 
      String? seoDescription, 
      String? seoKeywords, 
      String? additionalCost, 
      List<String>? slugHistory, 
      String? id, 
      String? slug, 
      num? v,}){
    _name = name;
    _description = description;
    _descriptionAfterContent = descriptionAfterContent;
    _parent = parent;
    _file = file;
    _createdDate = createdDate;
    _updateDate = updateDate;
    _active = active;
    _deleted = deleted;
    _seoTitle = seoTitle;
    _seoDescription = seoDescription;
    _seoKeywords = seoKeywords;
    _additionalCost = additionalCost;
    _slugHistory = slugHistory;
    _id = id;
    _slug = slug;
    _v = v;
}

  CatSubCat.fromJson(dynamic json) {
    _name = json['name'];
    _description = json['description'];
    _descriptionAfterContent = json['description_after_content'];
    _parent = json['parent'] != null ? Parent.fromJson(json['parent']) : null;
    _file = json['file'];
    _createdDate = json['created_date'];
    _updateDate = json['update_date'];
    _active = json['active'];
    _deleted = json['deleted'];
    _seoTitle = json['seo_title'];
    _seoDescription = json['seo_description'];
    _seoKeywords = json['seo_keywords'];
    _additionalCost = json['additional_cost'];
    _slugHistory = json['slug_history'] != null ? json['slug_history'].cast<String>() : [];
    _id = json['_id'];
    _slug = json['slug'];
    _v = json['__v'];
  }
  String? _name;
  String? _description;
  String? _descriptionAfterContent;
  Parent? _parent;
  String? _file;
  String? _createdDate;
  String? _updateDate;
  num? _active;
  num? _deleted;
  String? _seoTitle;
  String? _seoDescription;
  String? _seoKeywords;
  String? _additionalCost;
  List<String>? _slugHistory;
  String? _id;
  String? _slug;
  num? _v;
CatSubCat copyWith({  String? name,
  String? description,
  String? descriptionAfterContent,
  Parent? parent,
  String? file,
  String? createdDate,
  String? updateDate,
  num? active,
  num? deleted,
  String? seoTitle,
  String? seoDescription,
  String? seoKeywords,
  String? additionalCost,
  List<String>? slugHistory,
  String? id,
  String? slug,
  num? v,
}) => CatSubCat(  name: name ?? _name,
  description: description ?? _description,
  descriptionAfterContent: descriptionAfterContent ?? _descriptionAfterContent,
  parent: parent ?? _parent,
  file: file ?? _file,
  createdDate: createdDate ?? _createdDate,
  updateDate: updateDate ?? _updateDate,
  active: active ?? _active,
  deleted: deleted ?? _deleted,
  seoTitle: seoTitle ?? _seoTitle,
  seoDescription: seoDescription ?? _seoDescription,
  seoKeywords: seoKeywords ?? _seoKeywords,
  additionalCost: additionalCost ?? _additionalCost,
  slugHistory: slugHistory ?? _slugHistory,
  id: id ?? _id,
  slug: slug ?? _slug,
  v: v ?? _v,
);
  String? get name => _name;
  String? get description => _description;
  String? get descriptionAfterContent => _descriptionAfterContent;
  Parent? get parent => _parent;
  String? get file => _file;
  String? get createdDate => _createdDate;
  String? get updateDate => _updateDate;
  num? get active => _active;
  num? get deleted => _deleted;
  String? get seoTitle => _seoTitle;
  String? get seoDescription => _seoDescription;
  String? get seoKeywords => _seoKeywords;
  String? get additionalCost => _additionalCost;
  List<String>? get slugHistory => _slugHistory;
  String? get id => _id;
  String? get slug => _slug;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['description'] = _description;
    map['description_after_content'] = _descriptionAfterContent;
    if (_parent != null) {
      map['parent'] = _parent?.toJson();
    }
    map['file'] = _file;
    map['created_date'] = _createdDate;
    map['update_date'] = _updateDate;
    map['active'] = _active;
    map['deleted'] = _deleted;
    map['seo_title'] = _seoTitle;
    map['seo_description'] = _seoDescription;
    map['seo_keywords'] = _seoKeywords;
    map['additional_cost'] = _additionalCost;
    map['slug_history'] = _slugHistory;
    map['_id'] = _id;
    map['slug'] = _slug;
    map['__v'] = _v;
    return map;
  }

}

Parent parentFromJson(String str) => Parent.fromJson(json.decode(str));
String parentToJson(Parent data) => json.encode(data.toJson());
class Parent {
  Parent({
      String? name, 
      String? id,}){
    _name = name;
    _id = id;
}

  Parent.fromJson(dynamic json) {
    _name = json['name'];
    _id = json['_id'];
  }
  String? _name;
  String? _id;
Parent copyWith({  String? name,
  String? id,
}) => Parent(  name: name ?? _name,
  id: id ?? _id,
);
  String? get name => _name;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['_id'] = _id;
    return map;
  }

}