class LawyerAppointmentTransactionModel {
  String? message;
  int? respnseCode;
  Data? data;

  LawyerAppointmentTransactionModel(
      {this.message, this.respnseCode, this.data});

  LawyerAppointmentTransactionModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    respnseCode = json['respnse_code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['respnse_code'] = this.respnseCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? date;
  String? time;
  String? name;
  String? email;
  String? content;
  int? phoneNo;
  String? status;
  String? paymentNo;
  String? paymentMethod;
  double? paymentAmount;
  String? paymentStatus;
  double? likhitDeCommission;
  double? gatewayCommission;
  double? splitCharge;
  double? likhitDeNetAmt;
  double? likhitGstAmt;
  double? likhitTotalAmtGst;
  double? getwayAmt;
  double? getwayGstAmt;
  double? getwayTotalAmtGst;
  double? splitAmt;
  double? splitGstAmt;
  double? splitTotalAmtGst;
  double? totalDeductionFromLikhitDe;
  double? likhitDeNetProfitAmt;
  double? likhitDeNetProfitGstAmt;
  double? likhitDeTotalNetProfitAmtGst;
  double? payableAmountToLawyerAfterCharge;
  String? createdDate;
  String? updatedDate;
  Lawyer? lawyer;
  Client? client;
  Service? service;

  Data(
      {this.id,
        this.date,
        this.time,
        this.name,
        this.email,
        this.content,
        this.phoneNo,
        this.status,
        this.paymentNo,
        this.paymentMethod,
        this.paymentAmount,
        this.paymentStatus,
        this.likhitDeCommission,
        this.gatewayCommission,
        this.splitCharge,
        this.likhitDeNetAmt,
        this.likhitGstAmt,
        this.likhitTotalAmtGst,
        this.getwayAmt,
        this.getwayGstAmt,
        this.getwayTotalAmtGst,
        this.splitAmt,
        this.splitGstAmt,
        this.splitTotalAmtGst,
        this.totalDeductionFromLikhitDe,
        this.likhitDeNetProfitAmt,
        this.likhitDeNetProfitGstAmt,
        this.likhitDeTotalNetProfitAmtGst,
        this.payableAmountToLawyerAfterCharge,
        this.createdDate,
        this.updatedDate,
        this.lawyer,
        this.client,
        this.service});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    time = json['time'];
    name = json['name'];
    email = json['email'];
    content = json['content'];
    phoneNo = json['phone_no'];
    status = json['status'];
    paymentNo = json['payment_no'];
    paymentMethod = json['payment_method'];
    paymentAmount = json['payment_amount'];
    paymentStatus = json['payment_status'];
    likhitDeCommission = json['likhit_de_commission'];
    gatewayCommission = json['gateway_commission'];
    splitCharge = json['split_charge'];
    likhitDeNetAmt = json['likhit_de_net_amt'];
    likhitGstAmt = json['likhit_gst_amt'];
    likhitTotalAmtGst = json['likhit_total_amt_gst'];
    getwayAmt = json['getway_amt'];
    getwayGstAmt = json['getway_gst_amt'];
    getwayTotalAmtGst = json['getway_total_amt_gst'];
    splitAmt = json['split_amt'];
    splitGstAmt = json['split_gst_amt'];
    splitTotalAmtGst = json['split_total_amt_gst'];
    totalDeductionFromLikhitDe = json['total_deduction_from_likhit_de'];
    likhitDeNetProfitAmt = json['likhit_de_net_profit_amt'];
    likhitDeNetProfitGstAmt = json['likhit_de_net_profit_gst_amt'];
    likhitDeTotalNetProfitAmtGst = json['likhit_de_total_net_profit_amt_gst'];
    payableAmountToLawyerAfterCharge =
    json['payable_amount_to_lawyer_after_charge'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    lawyer =
    json['lawyer'] != null ? new Lawyer.fromJson(json['lawyer']) : null;
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
    service =
    json['service'] != null ? new Service.fromJson(json['service']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['time'] = this.time;
    data['name'] = this.name;
    data['email'] = this.email;
    data['content'] = this.content;
    data['phone_no'] = this.phoneNo;
    data['status'] = this.status;
    data['payment_no'] = this.paymentNo;
    data['payment_method'] = this.paymentMethod;
    data['payment_amount'] = this.paymentAmount;
    data['payment_status'] = this.paymentStatus;
    data['likhit_de_commission'] = this.likhitDeCommission;
    data['gateway_commission'] = this.gatewayCommission;
    data['split_charge'] = this.splitCharge;
    data['likhit_de_net_amt'] = this.likhitDeNetAmt;
    data['likhit_gst_amt'] = this.likhitGstAmt;
    data['likhit_total_amt_gst'] = this.likhitTotalAmtGst;
    data['getway_amt'] = this.getwayAmt;
    data['getway_gst_amt'] = this.getwayGstAmt;
    data['getway_total_amt_gst'] = this.getwayTotalAmtGst;
    data['split_amt'] = this.splitAmt;
    data['split_gst_amt'] = this.splitGstAmt;
    data['split_total_amt_gst'] = this.splitTotalAmtGst;
    data['total_deduction_from_likhit_de'] = this.totalDeductionFromLikhitDe;
    data['likhit_de_net_profit_amt'] = this.likhitDeNetProfitAmt;
    data['likhit_de_net_profit_gst_amt'] = this.likhitDeNetProfitGstAmt;
    data['likhit_de_total_net_profit_amt_gst'] =
        this.likhitDeTotalNetProfitAmtGst;
    data['payable_amount_to_lawyer_after_charge'] =
        this.payableAmountToLawyerAfterCharge;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    if (this.lawyer != null) {
      data['lawyer'] = this.lawyer!.toJson();
    }
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    return data;
  }
}

class Lawyer {
  int? id;
  String? lawyerid;
  String? nfcid;
  String? name;
  String? address;
  String? mobile;
  String? email;
  String? dob;
  String? about;
  String? gender;
  Null? servicesOffered;
  List<String>? specialties;
  String? experience;
  String? image;
  String? websiteUrl;
  List<String>? languageSpoken;
  List<String>? languageWritten;
  String? country;
  String? state;
  String? city;
  bool? isActivate;
  bool? nfcActivate;
  String? isCreated;
  String? lastLogin;
  String? approvalStatus;
  int? store;
  int? user;

  Lawyer(
      {this.id,
        this.lawyerid,
        this.nfcid,
        this.name,
        this.address,
        this.mobile,
        this.email,
        this.dob,
        this.about,
        this.gender,
        this.servicesOffered,
        this.specialties,
        this.experience,
        this.image,
        this.websiteUrl,
        this.languageSpoken,
        this.languageWritten,
        this.country,
        this.state,
        this.city,
        this.isActivate,
        this.nfcActivate,
        this.isCreated,
        this.lastLogin,
        this.approvalStatus,
        this.store,
        this.user});

  Lawyer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lawyerid = json['lawyerid'];
    nfcid = json['nfcid'];
    name = json['name'];
    address = json['address'];
    mobile = json['mobile'];
    email = json['email'];
    dob = json['dob'];
    about = json['about'];
    gender = json['gender'];
    servicesOffered = json['services_offered'];
    specialties = json['specialties'].cast<String>();
    experience = json['experience'];
    image = json['image'];
    websiteUrl = json['website_url'];
    languageSpoken = json['language_spoken'].cast<String>();
    languageWritten = json['language_written'].cast<String>();
    country = json['country'];
    state = json['state'];
    city = json['city'];
    isActivate = json['is_activate'];
    nfcActivate = json['nfc_activate'];
    isCreated = json['is_created'];
    lastLogin = json['last_login'];
    approvalStatus = json['approval_status'];
    store = json['store'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lawyerid'] = this.lawyerid;
    data['nfcid'] = this.nfcid;
    data['name'] = this.name;
    data['address'] = this.address;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['about'] = this.about;
    data['gender'] = this.gender;
    data['services_offered'] = this.servicesOffered;
    data['specialties'] = this.specialties;
    data['experience'] = this.experience;
    data['image'] = this.image;
    data['website_url'] = this.websiteUrl;
    data['language_spoken'] = this.languageSpoken;
    data['language_written'] = this.languageWritten;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['is_activate'] = this.isActivate;
    data['nfc_activate'] = this.nfcActivate;
    data['is_created'] = this.isCreated;
    data['last_login'] = this.lastLogin;
    data['approval_status'] = this.approvalStatus;
    data['store'] = this.store;
    data['user'] = this.user;
    return data;
  }
}

class Client {
  int? id;
  String? createdDate;
  String? updatedDate;
  String? name;
  String? address;
  String? mobile;
  String? email;
  String? dob;
  String? gender;
  String? image;
  String? country;
  String? state;
  String? city;
  bool? isActivate;
  int? store;
  int? user;

  Client(
      {this.id,
        this.createdDate,
        this.updatedDate,
        this.name,
        this.address,
        this.mobile,
        this.email,
        this.dob,
        this.gender,
        this.image,
        this.country,
        this.state,
        this.city,
        this.isActivate,
        this.store,
        this.user});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    name = json['name'];
    address = json['address'];
    mobile = json['mobile'];
    email = json['email'];
    dob = json['dob'];
    gender = json['gender'];
    image = json['image'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    isActivate = json['is_activate'];
    store = json['store'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    data['name'] = this.name;
    data['address'] = this.address;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['image'] = this.image;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['is_activate'] = this.isActivate;
    data['store'] = this.store;
    data['user'] = this.user;
    return data;
  }
}

class Service {
  int? id;
  String? title;
  String? subtitle;
  String? fee;
  int? lawyer;

  Service({this.id, this.title, this.subtitle, this.fee, this.lawyer});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    fee = json['fee'];
    lawyer = json['lawyer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['fee'] = this.fee;
    data['lawyer'] = this.lawyer;
    return data;
  }
}
