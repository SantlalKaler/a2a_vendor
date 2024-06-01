import 'dart:convert';

Banner bannerFromJson(String str) => Banner.fromJson(json.decode(str));
String bannerToJson(Banner data) => json.encode(data.toJson());
class Banner {
  Banner({
    String? fieldname,
    String? originalname,
    String? encoding,
    String? mimetype,
    num? size,
    String? bucket,
    String? key,
    String? acl,
    String? contentType,
    dynamic contentDisposition,
    dynamic contentEncoding,
    String? storageClass,
    dynamic serverSideEncryption,
    dynamic metadata,
    String? location,
    String? etag,
    dynamic versionId,}){
    _fieldname = fieldname;
    _originalname = originalname;
    _encoding = encoding;
    _mimetype = mimetype;
    _size = size;
    _bucket = bucket;
    _key = key;
    _acl = acl;
    _contentType = contentType;
    _contentDisposition = contentDisposition;
    _contentEncoding = contentEncoding;
    _storageClass = storageClass;
    _serverSideEncryption = serverSideEncryption;
    _metadata = metadata;
    _location = location;
    _etag = etag;
    _versionId = versionId;
  }

  Banner.fromJson(dynamic json) {
    _fieldname = json['fieldname'];
    _originalname = json['originalname'];
    _encoding = json['encoding'];
    _mimetype = json['mimetype'];
    _size = json['size'];
    _bucket = json['bucket'];
    _key = json['key'];
    _acl = json['acl'];
    _contentType = json['contentType'];
    _contentDisposition = json['contentDisposition'];
    _contentEncoding = json['contentEncoding'];
    _storageClass = json['storageClass'];
    _serverSideEncryption = json['serverSideEncryption'];
    _metadata = json['metadata'];
    _location = json['location'];
    _etag = json['etag'];
    _versionId = json['versionId'];
  }
  String? _fieldname;
  String? _originalname;
  String? _encoding;
  String? _mimetype;
  num? _size;
  String? _bucket;
  String? _key;
  String? _acl;
  String? _contentType;
  dynamic _contentDisposition;
  dynamic _contentEncoding;
  String? _storageClass;
  dynamic _serverSideEncryption;
  dynamic _metadata;
  String? _location;
  String? _etag;
  dynamic _versionId;
  Banner copyWith({  String? fieldname,
    String? originalname,
    String? encoding,
    String? mimetype,
    num? size,
    String? bucket,
    String? key,
    String? acl,
    String? contentType,
    dynamic contentDisposition,
    dynamic contentEncoding,
    String? storageClass,
    dynamic serverSideEncryption,
    dynamic metadata,
    String? location,
    String? etag,
    dynamic versionId,
  }) => Banner(  fieldname: fieldname ?? _fieldname,
    originalname: originalname ?? _originalname,
    encoding: encoding ?? _encoding,
    mimetype: mimetype ?? _mimetype,
    size: size ?? _size,
    bucket: bucket ?? _bucket,
    key: key ?? _key,
    acl: acl ?? _acl,
    contentType: contentType ?? _contentType,
    contentDisposition: contentDisposition ?? _contentDisposition,
    contentEncoding: contentEncoding ?? _contentEncoding,
    storageClass: storageClass ?? _storageClass,
    serverSideEncryption: serverSideEncryption ?? _serverSideEncryption,
    metadata: metadata ?? _metadata,
    location: location ?? _location,
    etag: etag ?? _etag,
    versionId: versionId ?? _versionId,
  );
  String? get fieldname => _fieldname;
  String? get originalname => _originalname;
  String? get encoding => _encoding;
  String? get mimetype => _mimetype;
  num? get size => _size;
  String? get bucket => _bucket;
  String? get key => _key;
  String? get acl => _acl;
  String? get contentType => _contentType;
  dynamic get contentDisposition => _contentDisposition;
  dynamic get contentEncoding => _contentEncoding;
  String? get storageClass => _storageClass;
  dynamic get serverSideEncryption => _serverSideEncryption;
  dynamic get metadata => _metadata;
  String? get location => _location;
  String? get etag => _etag;
  dynamic get versionId => _versionId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fieldname'] = _fieldname;
    map['originalname'] = _originalname;
    map['encoding'] = _encoding;
    map['mimetype'] = _mimetype;
    map['size'] = _size;
    map['bucket'] = _bucket;
    map['key'] = _key;
    map['acl'] = _acl;
    map['contentType'] = _contentType;
    map['contentDisposition'] = _contentDisposition;
    map['contentEncoding'] = _contentEncoding;
    map['storageClass'] = _storageClass;
    map['serverSideEncryption'] = _serverSideEncryption;
    map['metadata'] = _metadata;
    map['location'] = _location;
    map['etag'] = _etag;
    map['versionId'] = _versionId;
    return map;
  }

}