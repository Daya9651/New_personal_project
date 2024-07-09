class ContactAddSocialMediaModel {
  String? message;
  int? responseCode;
  List<SocialMediaData>? data;

  ContactAddSocialMediaModel({this.message, this.responseCode, this.data});

  ContactAddSocialMediaModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    responseCode = json['response_code'];
    if (json['data'] != null) {
      data = <SocialMediaData>[];
      json['data'].forEach((v) {
        data!.add(new SocialMediaData.fromJson(v));
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

class SocialMediaData {
  int? id;
  String? platform;
  String? url;
  String? whatsappNumber;

  SocialMediaData({this.id, this.platform, this.url, this.whatsappNumber});

  SocialMediaData.fromJson(Map<String, dynamic> json) {
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
