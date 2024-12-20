import 'package:get/get.dart';

class ProfileModel {
  String? message;
  int? responseCode;
  bool? kyc;
  Data? data;

  ProfileModel({this.message, this.responseCode, this.data, this.kyc});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    responseCode = json['response_code'];
    kyc = json['kyc'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['response_code'] = responseCode;
    data['kyc'] = kyc;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? email;
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
  double? rating;

  Data(
      {this.id,
        this.email,
        this.lawyerid,
        this.nfcid,
        this.name,
        this.address,
        this.mobile,
        this.dob,
        this.about,
        this.gender,
        this.rating,
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

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    lawyerid = json['lawyerid'];
    nfcid = json['nfcid'];
    name = json['name'];
    address = json['address'];
    mobile = json['mobile'];
    dob = json['dob'];
    rating = json['avg_rating'];
    about = json['about'];
    gender = json['gender'];
    servicesOffered = json['services_offered'];
    specialties = (json['specialties'] as List<dynamic>?)?.map((e) => e as String).toList();
    experience = json['experience'];
    image = json['image'];
    websiteUrl = json['website_url'];
    languageSpoken = (json['language_spoken'] as List<dynamic>?)?.map((e) => e as String).toList();
    languageWritten = (json['language_written'] as List<dynamic>?)?.map((e) => e as String).toList();
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
    data['email'] = email;
    data['lawyerid'] = lawyerid;
    data['nfcid'] = nfcid;
    data['name'] = name;
    data['address'] = address;
    data['mobile'] = mobile;
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
