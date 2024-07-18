class ClientProfileModel {
  String? message;
  int? responseCode;
  ProfileData? data;

  ClientProfileModel({this.message, this.responseCode, this.data});

  ClientProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    responseCode = json['response_code'];
    data = json['data'] != null ? new ProfileData.fromJson(json['data']) : null;
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

class ProfileData {
  int? id;
  String? email;
  String? createdDate;
  String? updatedDate;
  String? name;
  String? address;
  String? mobile;
  String? dob;
  String? gender;
  String? image;
  String? country;
  String? state;
  String? city;
  int? store;
  int? user;

  ProfileData(
      {this.id,
      this.email,
      this.createdDate,
      this.updatedDate,
      this.name,
      this.address,
      this.mobile,
      this.dob,
      this.gender,
      this.image,
      this.country,
      this.state,
      this.city,
      this.store,
      this.user});

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    name = json['name'];
    address = json['address'];
    mobile = json['mobile'];
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    data['name'] = this.name;
    data['address'] = this.address;
    data['mobile'] = this.mobile;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['image'] = this.image;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['store'] = this.store;
    data['user'] = this.user;
    return data;
  }
}
