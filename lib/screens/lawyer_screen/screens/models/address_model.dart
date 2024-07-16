class AddressModel {
  List<Data>? data;
  int? responseCode;

  AddressModel({this.data, this.responseCode});

  AddressModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    responseCode = json['response_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['response_code'] = responseCode;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? mobileNumber;
  String? address;
  String? pincode;
  String? country;
  String? state;
  String? city;
  String? addressType;
  bool? isActive;
  String? createdDate;
  String? updatedDate;

  Data(
      {this.id,
        this.name,
        this.mobileNumber,
        this.address,
        this.pincode,
        this.country,
        this.state,
        this.city,
        this.addressType,
        this.isActive,
        this.createdDate,
        this.updatedDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobileNumber = json['mobile_number'];
    address = json['address'];
    pincode = json['pincode'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    addressType = json['address_type'];
    isActive = json['is_active'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mobile_number'] = mobileNumber;
    data['address'] = address;
    data['pincode'] = pincode;
    data['country'] = country;
    data['state'] = state;
    data['city'] = city;
    data['address_type'] = addressType;
    data['is_active'] = isActive;
    data['created_date'] = createdDate;
    data['updated_date'] = updatedDate;
    return data;
  }
}
