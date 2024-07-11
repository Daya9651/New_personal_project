
class ContactAddPhoneNumberModel {
  String? message;
  int? responseCode;
  List<ContactNumber>? data;

  ContactAddPhoneNumberModel({this.message, this.responseCode, this.data});

  ContactAddPhoneNumberModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    responseCode = json['response_code'];
    if (json['data'] != null) {
      data = <ContactNumber>[];
      json['data'].forEach((v) {
        data!.add(new ContactNumber.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['response_code'] = this.responseCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContactNumber {
  int? id;
  String? title;
  String? number;

  ContactNumber({this.id, this.title, this.number});

  ContactNumber.fromJson(Map<String, dynamic> json) {
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
