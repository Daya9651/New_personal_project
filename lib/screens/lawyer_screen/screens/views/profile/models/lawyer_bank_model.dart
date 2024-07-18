class LawyerBankModel {
  String? message;
  int? responseCode;
  List<Data>? data;

  LawyerBankModel({this.message, this.responseCode, this.data});

  LawyerBankModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    responseCode = json['response_code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['response_code'] = responseCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? accountHolderName;
  String? bankName;
  int? accountNumber;
  String? ifscCode;
  String? accountType;
  int? micrCode;
  String? upiId;
  dynamic qrCode;

  Data(
      {this.id,
        this.accountHolderName,
        this.bankName,
        this.accountNumber,
        this.ifscCode,
        this.accountType,
        this.micrCode,
        this.upiId,
        this.qrCode});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountHolderName = json['account_holder_name'];
    bankName = json['bank_name'];
    accountNumber = json['account_number'];
    ifscCode = json['ifsc_code'];
    accountType = json['account_type'];
    micrCode = json['micr_code'];
    upiId = json['upi_id'];
    qrCode = json['qr_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['account_holder_name'] = accountHolderName;
    data['bank_name'] = bankName;
    data['account_number'] = accountNumber;
    data['ifsc_code'] = ifscCode;
    data['account_type'] = accountType;
    data['micr_code'] = micrCode;
    data['upi_id'] = upiId;
    data['qr_code'] = qrCode;
    return data;
  }
}
