class ClientAppointmentTransModel {
  String? message;
  int? respnseCode;
  int? count;
  int? currentPage;
  int? totalPages;
  List<Data>? data;

  ClientAppointmentTransModel(
      {this.message,
        this.respnseCode,
        this.count,
        this.currentPage,
        this.totalPages,
        this.data});

  ClientAppointmentTransModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    respnseCode = json['respnse_code'];
    count = json['count'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['respnse_code'] = respnseCode;
    data['count'] = count;
    data['current_page'] = currentPage;
    data['total_pages'] = totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? lawyerName;
  String? serviceFee;
  String? serviceName;
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
  int? likhitDeCommission;
  double? gatewayCommission;
  double? splitCharge;
  int? likhitDeNetAmt;
  double? likhitGstAmt;
  double? likhitTotalAmtGst;
  int? getwayAmt;
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
        this.lawyerName,
        this.serviceFee,
        this.serviceName,
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
    lawyerName = json['lawyer_name'];
    serviceFee = json['service_fee'];
    serviceName = json['service_name'];
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
    json['lawyer'] != null ? Lawyer.fromJson(json['lawyer']) : null;
    client =
    json['client'] != null ? Client.fromJson(json['client']) : null;
    service =
    json['service'] != null ? Service.fromJson(json['service']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['lawyer_name'] = lawyerName;
    data['service_fee'] = serviceFee;
    data['service_name'] = serviceName;
    data['date'] = date;
    data['time'] = time;
    data['name'] = name;
    data['email'] = email;
    data['content'] = content;
    data['phone_no'] = phoneNo;
    data['status'] = status;
    data['payment_no'] = paymentNo;
    data['payment_method'] = paymentMethod;
    data['payment_amount'] = paymentAmount;
    data['payment_status'] = paymentStatus;
    data['likhit_de_commission'] = likhitDeCommission;
    data['gateway_commission'] = gatewayCommission;
    data['split_charge'] = splitCharge;
    data['likhit_de_net_amt'] = likhitDeNetAmt;
    data['likhit_gst_amt'] = likhitGstAmt;
    data['likhit_total_amt_gst'] = likhitTotalAmtGst;
    data['getway_amt'] = getwayAmt;
    data['getway_gst_amt'] = getwayGstAmt;
    data['getway_total_amt_gst'] = getwayTotalAmtGst;
    data['split_amt'] = splitAmt;
    data['split_gst_amt'] = splitGstAmt;
    data['split_total_amt_gst'] = splitTotalAmtGst;
    data['total_deduction_from_likhit_de'] = totalDeductionFromLikhitDe;
    data['likhit_de_net_profit_amt'] = likhitDeNetProfitAmt;
    data['likhit_de_net_profit_gst_amt'] = likhitDeNetProfitGstAmt;
    data['likhit_de_total_net_profit_amt_gst'] =
        likhitDeTotalNetProfitAmtGst;
    data['payable_amount_to_lawyer_after_charge'] =
        payableAmountToLawyerAfterCharge;
    data['created_date'] = createdDate;
    data['updated_date'] = updatedDate;
    if (lawyer != null) {
      data['lawyer'] = lawyer!.toJson();
    }
    if (client != null) {
      data['client'] = client!.toJson();
    }
    if (service != null) {
      data['service'] = service!.toJson();
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
  String? servicesOffered;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['lawyerid'] = lawyerid;
    data['nfcid'] = nfcid;
    data['name'] = name;
    data['address'] = address;
    data['mobile'] = mobile;
    data['email'] = email;
    data['dob'] = dob;
    data['about'] = about;
    data['gender'] = gender;
    data['services_offered'] = servicesOffered;
    data['specialties'] = specialties;
    data['experience'] = experience;
    data['image'] = image;
    data['website_url'] = websiteUrl;
    data['language_spoken'] = languageSpoken;
    data['language_written'] = languageWritten;
    data['country'] = country;
    data['state'] = state;
    data['city'] = city;
    data['is_activate'] = isActivate;
    data['nfc_activate'] = nfcActivate;
    data['is_created'] = isCreated;
    data['last_login'] = lastLogin;
    data['approval_status'] = approvalStatus;
    data['store'] = store;
    data['user'] = user;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_date'] = createdDate;
    data['updated_date'] = updatedDate;
    data['name'] = name;
    data['address'] = address;
    data['mobile'] = mobile;
    data['email'] = email;
    data['dob'] = dob;
    data['gender'] = gender;
    data['image'] = image;
    data['country'] = country;
    data['state'] = state;
    data['city'] = city;
    data['is_activate'] = isActivate;
    data['store'] = store;
    data['user'] = user;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['fee'] = fee;
    data['lawyer'] = lawyer;
    return data;
  }
}
