
import 'dart:convert';

City cityFromJson(String str) => City.fromJson(json.decode(str));
String cityToJson(City data) => json.encode(data.toJson());
class City {
  City({
    String? id,
    String? name,
    String? description,
    String? descriptionAfterContent,
    String? file,
    String? createdDate,
    String? updateDate,
    num? active,
    num? deleted,
    String? ps,
    bool? cod,
    String? state,
    String? file2,
    num? footer,
    String? heading,
    String? subHeading,
    String? footerContent,
    List<String>? slugHistory,
    String? slug,
    num? v,
    String? seoDescription,
    String? seoKeywords,
    String? seoTitle,
    String? extraDeliveryCharges,
    String? maximumCodOrderValue,
    String? minimumOrderValue,}){
    _id = id;
    _name = name;
    _description = description;
    _descriptionAfterContent = descriptionAfterContent;
    _file = file;
    _createdDate = createdDate;
    _updateDate = updateDate;
    _active = active;
    _deleted = deleted;
    _ps = ps;
    _cod = cod;
    _state = state;
    _file2 = file2;
    _footer = footer;
    _heading = heading;
    _subHeading = subHeading;
    _footerContent = footerContent;
    _slugHistory = slugHistory;
    _slug = slug;
    _v = v;
    _seoDescription = seoDescription;
    _seoKeywords = seoKeywords;
    _seoTitle = seoTitle;
    _extraDeliveryCharges = extraDeliveryCharges;
    _maximumCodOrderValue = maximumCodOrderValue;
    _minimumOrderValue = minimumOrderValue;
  }

  City.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _description = json['description'];
    _descriptionAfterContent = json['description_after_content'];
    _file = json['file'];
    _createdDate = json['created_date'];
    _updateDate = json['update_date'];
    _active = json['active'];
    _deleted = json['deleted'];
    _ps = json['ps'];
    _cod = json['cod'];
    _state = json['state'];
    _file2 = json['file2'];
    _footer = json['footer'];
    _heading = json['heading'];
    _subHeading = json['sub_heading'];
    _footerContent = json['footer_content'];
    _slugHistory = json['slug_history'] != null ? json['slug_history'].cast<String>() : [];
    _slug = json['slug'];
    _v = json['__v'];
    _seoDescription = json['seo_description'];
    _seoKeywords = json['seo_keywords'];
    _seoTitle = json['seo_title'];
    _extraDeliveryCharges = json['extra_delivery_charges'];
    _maximumCodOrderValue = json['maximum_cod_order_value'];
    _minimumOrderValue = json['minimum_order_value'];
  }
  String? _id;
  String? _name;
  String? _description;
  String? _descriptionAfterContent;
  String? _file;
  String? _createdDate;
  String? _updateDate;
  num? _active;
  num? _deleted;
  String? _ps;
  bool? _cod;
  String? _state;
  String? _file2;
  num? _footer;
  String? _heading;
  String? _subHeading;
  String? _footerContent;
  List<String>? _slugHistory;
  String? _slug;
  num? _v;
  String? _seoDescription;
  String? _seoKeywords;
  String? _seoTitle;
  String? _extraDeliveryCharges;
  String? _maximumCodOrderValue;
  String? _minimumOrderValue;
  City copyWith({  String? id,
    String? name,
    String? description,
    String? descriptionAfterContent,
    String? file,
    String? createdDate,
    String? updateDate,
    num? active,
    num? deleted,
    String? ps,
    bool? cod,
    String? state,
    String? file2,
    num? footer,
    String? heading,
    String? subHeading,
    String? footerContent,
    List<String>? slugHistory,
    String? slug,
    num? v,
    String? seoDescription,
    String? seoKeywords,
    String? seoTitle,
    String? extraDeliveryCharges,
    String? maximumCodOrderValue,
    String? minimumOrderValue,
  }) => City(  id: id ?? _id,
    name: name ?? _name,
    description: description ?? _description,
    descriptionAfterContent: descriptionAfterContent ?? _descriptionAfterContent,
    file: file ?? _file,
    createdDate: createdDate ?? _createdDate,
    updateDate: updateDate ?? _updateDate,
    active: active ?? _active,
    deleted: deleted ?? _deleted,
    ps: ps ?? _ps,
    cod: cod ?? _cod,
    state: state ?? _state,
    file2: file2 ?? _file2,
    footer: footer ?? _footer,
    heading: heading ?? _heading,
    subHeading: subHeading ?? _subHeading,
    footerContent: footerContent ?? _footerContent,
    slugHistory: slugHistory ?? _slugHistory,
    slug: slug ?? _slug,
    v: v ?? _v,
    seoDescription: seoDescription ?? _seoDescription,
    seoKeywords: seoKeywords ?? _seoKeywords,
    seoTitle: seoTitle ?? _seoTitle,
    extraDeliveryCharges: extraDeliveryCharges ?? _extraDeliveryCharges,
    maximumCodOrderValue: maximumCodOrderValue ?? _maximumCodOrderValue,
    minimumOrderValue: minimumOrderValue ?? _minimumOrderValue,
  );
  String? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get descriptionAfterContent => _descriptionAfterContent;
  String? get file => _file;
  String? get createdDate => _createdDate;
  String? get updateDate => _updateDate;
  num? get active => _active;
  num? get deleted => _deleted;
  String? get ps => _ps;
  bool? get cod => _cod;
  String? get state => _state;
  String? get file2 => _file2;
  num? get footer => _footer;
  String? get heading => _heading;
  String? get subHeading => _subHeading;
  String? get footerContent => _footerContent;
  List<String>? get slugHistory => _slugHistory;
  String? get slug => _slug;
  num? get v => _v;
  String? get seoDescription => _seoDescription;
  String? get seoKeywords => _seoKeywords;
  String? get seoTitle => _seoTitle;
  String? get extraDeliveryCharges => _extraDeliveryCharges;
  String? get maximumCodOrderValue => _maximumCodOrderValue;
  String? get minimumOrderValue => _minimumOrderValue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['description_after_content'] = _descriptionAfterContent;
    map['file'] = _file;
    map['created_date'] = _createdDate;
    map['update_date'] = _updateDate;
    map['active'] = _active;
    map['deleted'] = _deleted;
    map['ps'] = _ps;
    map['cod'] = _cod;
    map['state'] = _state;
    map['file2'] = _file2;
    map['footer'] = _footer;
    map['heading'] = _heading;
    map['sub_heading'] = _subHeading;
    map['footer_content'] = _footerContent;
    map['slug_history'] = _slugHistory;
    map['slug'] = _slug;
    map['__v'] = _v;
    map['seo_description'] = _seoDescription;
    map['seo_keywords'] = _seoKeywords;
    map['seo_title'] = _seoTitle;
    map['extra_delivery_charges'] = _extraDeliveryCharges;
    map['maximum_cod_order_value'] = _maximumCodOrderValue;
    map['minimum_order_value'] = _minimumOrderValue;
    return map;
  }

}