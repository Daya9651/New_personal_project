class PaymentRequestTransactionModel {
  String? message;
  int? respnseCode;
  int? count;
  int? currentPage;
  int? totalPages;
  List<Data>? data;

  PaymentRequestTransactionModel(
      {this.message,
        this.respnseCode,
        this.count,
        this.currentPage,
        this.totalPages,
        this.data});

  PaymentRequestTransactionModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    respnseCode = json['respnse_code'];
    count = json['count'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
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
  String? paymentId;
  double? paymentAmount;
  String? paymentFor;
  String? expiryTime;
  String? paymentLink;
  String? createdDate;
  String? updatedDate;
  String? status;
  Lawyer? lawyer;
  Client? client;

  Data(
      {this.id,
        this.paymentId,
        this.paymentAmount,
        this.paymentFor,
        this.expiryTime,
        this.paymentLink,
        this.createdDate,
        this.updatedDate,
        this.status,
        this.lawyer,
        this.client});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paymentId = json['payment_id'];
    paymentAmount = json['payment_amount'];
    paymentFor = json['payment_for'];
    expiryTime = json['expiry_time'];
    paymentLink = json['payment_link'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    status = json['status'];
    lawyer =
    json['lawyer'] != null ? new Lawyer.fromJson(json['lawyer']) : null;
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['payment_id'] = paymentId;
    data['payment_amount'] = paymentAmount;
    data['payment_for'] = paymentFor;
    data['expiry_time'] = expiryTime;
    data['payment_link'] = paymentLink;
    data['created_date'] = createdDate;
    data['updated_date'] = updatedDate;
    data['status'] = status;
    if (lawyer != null) {
      data['lawyer'] = lawyer!.toJson();
    }
    if (client != null) {
      data['client'] = client!.toJson();
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
    data['store'] = store;
    data['user'] = user;
    return data;
  }
}
