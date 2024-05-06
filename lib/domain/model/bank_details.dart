
import 'dart:convert';

BankDetails bankDetailsFromJson(String str) =>
    BankDetails.fromJson(json.decode(str));

String bankDetailsToJson(BankDetails data) => json.encode(data.toJson());

class BankDetails {
  BankDetails({
    String? accNo,
    String? bankName,
    String? bankLocation,
    String? ifscCode,
    String? accHolderName,
  }) {
    _accNo = accNo;
    _bankName = bankName;
    _bankLocation = bankLocation;
    _ifscCode = ifscCode;
    _accHolderName = accHolderName;
  }

  BankDetails.fromJson(dynamic json) {
    _accNo = json['acc_no'];
    _bankName = json['bank_name'];
    _bankLocation = json['bank_location'];
    _ifscCode = json['ifsc_code'];
    _accHolderName = json['acc_holder_name'];
  }

  String? _accNo;
  String? _bankName;
  String? _bankLocation;
  String? _ifscCode;
  String? _accHolderName;

  BankDetails copyWith({
    String? accNo,
    String? bankName,
    String? bankLocation,
    String? ifscCode,
    String? accHolderName,
  }) =>
      BankDetails(
        accNo: accNo ?? _accNo,
        bankName: bankName ?? _bankName,
        bankLocation: bankLocation ?? _bankLocation,
        ifscCode: ifscCode ?? _ifscCode,
        accHolderName: accHolderName ?? _accHolderName,
      );

  String? get accNo => _accNo;

  String? get bankName => _bankName;

  String? get bankLocation => _bankLocation;

  String? get ifscCode => _ifscCode;

  String? get accHolderName => _accHolderName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['acc_no'] = _accNo;
    map['bank_name'] = _bankName;
    map['bank_location'] = _bankLocation;
    map['ifsc_code'] = _ifscCode;
    map['acc_holder_name'] = _accHolderName;
    return map;
  }
}