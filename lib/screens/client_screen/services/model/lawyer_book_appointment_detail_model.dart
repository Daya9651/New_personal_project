class LawyerBookAppointmentDetailModel {
  BookAppointmentLawyerData? data;
  int? responseCode;

  LawyerBookAppointmentDetailModel({this.data, this.responseCode});

  LawyerBookAppointmentDetailModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new BookAppointmentLawyerData.fromJson(json['data'])
        : null;
    responseCode = json['response_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['response_code'] = this.responseCode;
    return data;
  }
}

class BookAppointmentLawyerData {
  int? id;
  List<Experiences>? experiences;
  List<EducationCredentials>? educationCredentials;
  List<String>? images;
  List<OperatingHours>? operatingHours;
  List<Phone>? phone;
  List<Email>? email;
  List<OfficeLocation>? officeLocation;
  List<SocialMedia>? socialMedia;
  List<Fees>? fees;
  List<Bank>? bank;
  List<BarId>? barId;
  List<Preferredcourt>? preferredcourt;
  List<BarAssociation>? barAssociation;
  List<Reviews>? reviews;
  String? lawyerid;
  String? nfcid;
  String? name;
  String? address;
  String? mobile;
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

  BookAppointmentLawyerData(
      {this.id,
      this.experiences,
      this.educationCredentials,
      this.images,
      this.operatingHours,
      this.phone,
      this.email,
      this.officeLocation,
      this.socialMedia,
      this.fees,
      this.bank,
      this.barId,
      this.preferredcourt,
      this.barAssociation,
      this.reviews,
      this.lawyerid,
      this.nfcid,
      this.name,
      this.address,
      this.mobile,
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

  BookAppointmentLawyerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['experiences'] != null) {
      experiences = <Experiences>[];
      json['experiences'].forEach((v) {
        experiences!.add(new Experiences.fromJson(v));
      });
    }
    if (json['education_credentials'] != null) {
      educationCredentials = <EducationCredentials>[];
      json['education_credentials'].forEach((v) {
        educationCredentials!.add(new EducationCredentials.fromJson(v));
      });
    }
    // if (json['images'] != null) {
    //   images = [];
    //   json['images'].forEach((v) {
    //     images!.add(new images.fromJson(v));
    //   });
    // }
    if (json['operating_hours'] != null) {
      operatingHours = <OperatingHours>[];
      json['operating_hours'].forEach((v) {
        operatingHours!.add(new OperatingHours.fromJson(v));
      });
    }
    if (json['phone'] != null) {
      phone = <Phone>[];
      json['phone'].forEach((v) {
        phone!.add(new Phone.fromJson(v));
      });
    }
    if (json['email'] != null) {
      email = <Email>[];
      json['email'].forEach((v) {
        email!.add(new Email.fromJson(v));
      });
    }
    if (json['office_location'] != null) {
      officeLocation = <OfficeLocation>[];
      json['office_location'].forEach((v) {
        officeLocation!.add(new OfficeLocation.fromJson(v));
      });
    }
    if (json['social_media'] != null) {
      socialMedia = <SocialMedia>[];
      json['social_media'].forEach((v) {
        socialMedia!.add(new SocialMedia.fromJson(v));
      });
    }
    if (json['fees'] != null) {
      fees = <Fees>[];
      json['fees'].forEach((v) {
        fees!.add(new Fees.fromJson(v));
      });
    }
    if (json['bank'] != null) {
      bank = <Bank>[];
      json['bank'].forEach((v) {
        bank!.add(new Bank.fromJson(v));
      });
    }
    if (json['bar_id'] != null) {
      barId = <BarId>[];
      json['bar_id'].forEach((v) {
        barId!.add(new BarId.fromJson(v));
      });
    }
    if (json['preferredcourt'] != null) {
      preferredcourt = <Preferredcourt>[];
      json['preferredcourt'].forEach((v) {
        preferredcourt!.add(new Preferredcourt.fromJson(v));
      });
    }
    if (json['bar_association'] != null) {
      barAssociation = <BarAssociation>[];
      json['bar_association'].forEach((v) {
        barAssociation!.add(new BarAssociation.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    lawyerid = json['lawyerid'];
    nfcid = json['nfcid'];
    name = json['name'];
    address = json['address'];
    mobile = json['mobile'];
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
    if (this.experiences != null) {
      data['experiences'] = this.experiences!.map((v) => v.toJson()).toList();
    }
    if (this.educationCredentials != null) {
      data['education_credentials'] =
          this.educationCredentials!.map((v) => v.toJson()).toList();
    }
    // if (this.images != null) {
    //   data['images'] = this.images!.map((v) => v.toJson()).toList();
    // }
    if (this.operatingHours != null) {
      data['operating_hours'] =
          this.operatingHours!.map((v) => v.toJson()).toList();
    }
    if (this.phone != null) {
      data['phone'] = this.phone!.map((v) => v.toJson()).toList();
    }
    if (this.email != null) {
      data['email'] = this.email!.map((v) => v.toJson()).toList();
    }
    if (this.officeLocation != null) {
      data['office_location'] =
          this.officeLocation!.map((v) => v.toJson()).toList();
    }
    if (this.socialMedia != null) {
      data['social_media'] = this.socialMedia!.map((v) => v.toJson()).toList();
    }
    if (this.fees != null) {
      data['fees'] = this.fees!.map((v) => v.toJson()).toList();
    }
    if (this.bank != null) {
      data['bank'] = this.bank!.map((v) => v.toJson()).toList();
    }
    if (this.barId != null) {
      data['bar_id'] = this.barId!.map((v) => v.toJson()).toList();
    }
    if (this.preferredcourt != null) {
      data['preferredcourt'] =
          this.preferredcourt!.map((v) => v.toJson()).toList();
    }
    if (this.barAssociation != null) {
      data['bar_association'] =
          this.barAssociation!.map((v) => v.toJson()).toList();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    data['lawyerid'] = this.lawyerid;
    data['nfcid'] = this.nfcid;
    data['name'] = this.name;
    data['address'] = this.address;
    data['mobile'] = this.mobile;
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

class Experiences {
  int? id;
  String? title;
  String? subtitle;
  String? fromDate;
  String? toDate;

  Experiences({this.id, this.title, this.subtitle, this.fromDate, this.toDate});

  Experiences.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    return data;
  }
}

class EducationCredentials {
  int? id;
  String? name;
  String? title;
  String? year;

  EducationCredentials({this.id, this.name, this.title, this.year});

  EducationCredentials.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title'] = this.title;
    data['year'] = this.year;
    return data;
  }
}

class OperatingHours {
  int? id;
  String? weekday;
  bool? open24;
  bool? close;
  String? morningOpen;
  String? morningClose;
  String? eveningOpen;
  String? eveningClose;

  OperatingHours(
      {this.id,
      this.weekday,
      this.open24,
      this.close,
      this.morningOpen,
      this.morningClose,
      this.eveningOpen,
      this.eveningClose});

  OperatingHours.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    weekday = json['weekday'];
    open24 = json['open24'];
    close = json['close'];
    morningOpen = json['morning_open'];
    morningClose = json['morning_close'];
    eveningOpen = json['evening_open'];
    eveningClose = json['evening_close'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['weekday'] = this.weekday;
    data['open24'] = this.open24;
    data['close'] = this.close;
    data['morning_open'] = this.morningOpen;
    data['morning_close'] = this.morningClose;
    data['evening_open'] = this.eveningOpen;
    data['evening_close'] = this.eveningClose;
    return data;
  }
}

class Phone {
  int? id;
  String? title;
  String? number;

  Phone({this.id, this.title, this.number});

  Phone.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['number'] = this.number;
    return data;
  }
}

class Email {
  int? id;
  String? email;

  Email({this.id, this.email});

  Email.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    return data;
  }
}

class OfficeLocation {
  int? id;
  String? street;
  String? apartment;
  String? country;
  String? state;
  String? city;
  String? pincode;
  String? latitude;
  String? longitude;

  OfficeLocation(
      {this.id,
      this.street,
      this.apartment,
      this.country,
      this.state,
      this.city,
      this.pincode,
      this.latitude,
      this.longitude});

  OfficeLocation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    street = json['street'];
    apartment = json['apartment'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    pincode = json['pincode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['street'] = this.street;
    data['apartment'] = this.apartment;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class SocialMedia {
  int? id;
  String? platform;
  String? url;
  String? whatsappNumber;

  SocialMedia({this.id, this.platform, this.url, this.whatsappNumber});

  SocialMedia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    platform = json['platform'];
    url = json['url'];
    whatsappNumber = json['whatsapp_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['platform'] = this.platform;
    data['url'] = this.url;
    data['whatsapp_number'] = this.whatsappNumber;
    return data;
  }
}

class Fees {
  int? id;
  String? title;
  String? subtitle;
  String? fee;
  int? lawyerId;

  Fees({this.id, this.title, this.subtitle, this.fee, this.lawyerId});

  Fees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    fee = json['fee'];
    lawyerId = json['lawyer_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['fee'] = this.fee;
    data['lawyer_id'] = this.lawyerId;
    return data;
  }
}

class Bank {
  int? id;
  String? accountHolderName;
  String? bankName;
  int? accountNumber;
  String? ifscCode;
  String? accountType;
  int? micrCode;
  String? upiId;
  Null? qrCode;

  Bank(
      {this.id,
      this.accountHolderName,
      this.bankName,
      this.accountNumber,
      this.ifscCode,
      this.accountType,
      this.micrCode,
      this.upiId,
      this.qrCode});

  Bank.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['account_holder_name'] = this.accountHolderName;
    data['bank_name'] = this.bankName;
    data['account_number'] = this.accountNumber;
    data['ifsc_code'] = this.ifscCode;
    data['account_type'] = this.accountType;
    data['micr_code'] = this.micrCode;
    data['upi_id'] = this.upiId;
    data['qr_code'] = this.qrCode;
    return data;
  }
}

class BarId {
  int? id;
  String? state;
  String? barId;
  String? admissionDate;
  String? isCreated;
  String? isUpdated;

  BarId(
      {this.id,
      this.state,
      this.barId,
      this.admissionDate,
      this.isCreated,
      this.isUpdated});

  BarId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    state = json['state'];
    barId = json['bar_id'];
    admissionDate = json['admission_date'];
    isCreated = json['is_created'];
    isUpdated = json['is_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['state'] = this.state;
    data['bar_id'] = this.barId;
    data['admission_date'] = this.admissionDate;
    data['is_created'] = this.isCreated;
    data['is_updated'] = this.isUpdated;
    return data;
  }
}

class Preferredcourt {
  int? id;
  String? court;
  String? location;
  String? isCreated;
  String? isUpdated;

  Preferredcourt(
      {this.id, this.court, this.location, this.isCreated, this.isUpdated});

  Preferredcourt.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    court = json['court'];
    location = json['location'];
    isCreated = json['is_created'];
    isUpdated = json['is_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['court'] = this.court;
    data['location'] = this.location;
    data['is_created'] = this.isCreated;
    data['is_updated'] = this.isUpdated;
    return data;
  }
}

class BarAssociation {
  int? id;
  String? barName;
  String? memberAt;
  String? isCreated;
  String? isUpdated;

  BarAssociation(
      {this.id, this.barName, this.memberAt, this.isCreated, this.isUpdated});

  BarAssociation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    barName = json['bar_name'];
    memberAt = json['member_at'];
    isCreated = json['is_created'];
    isUpdated = json['is_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bar_name'] = this.barName;
    data['member_at'] = this.memberAt;
    data['is_created'] = this.isCreated;
    data['is_updated'] = this.isUpdated;
    return data;
  }
}

class Reviews {
  int? id;
  String? userName;
  int? rating;
  String? comment;
  String? isCreated;
  int? likeCount;
  int? dislikeCount;

  Reviews(
      {this.id,
      this.userName,
      this.rating,
      this.comment,
      this.isCreated,
      this.likeCount,
      this.dislikeCount});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    rating = json['rating'];
    comment = json['comment'];
    isCreated = json['is_created'];
    likeCount = json['like_count'];
    dislikeCount = json['dislike_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['is_created'] = this.isCreated;
    data['like_count'] = this.likeCount;
    data['dislike_count'] = this.dislikeCount;
    return data;
  }
}
