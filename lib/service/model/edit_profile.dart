class editProfile {
  String? message;
  int? responseCode;
  Data? data;

  editProfile({this.message, this.responseCode, this.data});

  editProfile.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    responseCode = json['response_code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['response_code'] = this.responseCode;
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
  int? store;
  int? user;

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
    store = json['store'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
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
    data['store'] = this.store;
    data['user'] = this.user;
    return data;
  }
}
