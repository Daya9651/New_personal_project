class DirectTransactionInvoiceModel {
  String? message;
  int? responseCode;
  int? count;
  int? currentPage;
  int? totalPages;
  List<Data>? data;

  DirectTransactionInvoiceModel(
      {this.message,
        this.responseCode,
        this.count,
        this.currentPage,
        this.totalPages,
        this.data});

  DirectTransactionInvoiceModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    responseCode = json['response_code'];
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
    data['response_code'] = responseCode;
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
  String? paymentNo;
  String? createdDate;
  String? status;
  String? paymentMethod;
  String? totalPayableAmount;
  bool? isActivate;
  Null activationDate;
  Null deactivateAt;
  bool? free;
  Lawyer? lawyer;
  Plan? plan;
  Null delhiveryAddress;

  Data(
      {this.id,
        this.paymentNo,
        this.createdDate,
        this.status,
        this.paymentMethod,
        this.totalPayableAmount,
        this.isActivate,
        this.activationDate,
        this.deactivateAt,
        this.free,
        this.lawyer,
        this.plan,
        this.delhiveryAddress});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paymentNo = json['payment_no'];
    createdDate = json['created_date'];
    status = json['status'];
    paymentMethod = json['payment_method'];
    totalPayableAmount = json['total_payable_amount'];
    isActivate = json['is_activate'];
    activationDate = json['activation_date'];
    deactivateAt = json['deactivate_at'];
    free = json['free'];
    lawyer =
    json['lawyer'] != null ? Lawyer.fromJson(json['lawyer']) : null;
    plan = json['plan'] != null ? Plan.fromJson(json['plan']) : null;
    delhiveryAddress = json['delhivery_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['payment_no'] = paymentNo;
    data['created_date'] = createdDate;
    data['status'] = status;
    data['payment_method'] = paymentMethod;
    data['total_payable_amount'] = totalPayableAmount;
    data['is_activate'] = isActivate;
    data['activation_date'] = activationDate;
    data['deactivate_at'] = deactivateAt;
    data['free'] = free;
    if (lawyer != null) {
      data['lawyer'] = lawyer!.toJson();
    }
    if (plan != null) {
      data['plan'] = plan!.toJson();
    }
    data['delhivery_address'] = delhiveryAddress;
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
  List<String>? servicesOffered;
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
    servicesOffered = json['services_offered'].cast<String>();
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

class Plan {
  int? id;
  String? type;
  String? price;
  int? discount;
  int? gst;
  int? gatewayFee;
  int? delhiveryCharge;
  String? typeImage;
  bool? isActivate;
  String? isCreated;
  int? plan;

  Plan(
      {this.id,
        this.type,
        this.price,
        this.discount,
        this.gst,
        this.gatewayFee,
        this.delhiveryCharge,
        this.typeImage,
        this.isActivate,
        this.isCreated,
        this.plan});

  Plan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    price = json['price'];
    discount = json['discount'];
    gst = json['gst'];
    gatewayFee = json['gateway_fee'];
    delhiveryCharge = json['delhivery_charge'];
    typeImage = json['type_image'];
    isActivate = json['is_activate'];
    isCreated = json['is_created'];
    plan = json['plan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['price'] = price;
    data['discount'] = discount;
    data['gst'] = gst;
    data['gateway_fee'] = gatewayFee;
    data['delhivery_charge'] = delhiveryCharge;
    data['type_image'] = typeImage;
    data['is_activate'] = isActivate;
    data['is_created'] = isCreated;
    data['plan'] = plan;
    return data;
  }
}




