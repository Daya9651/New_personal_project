class LawyerServiceModel {
  List<Data>? data;
  int? responseCode;

  LawyerServiceModel({this.data, this.responseCode});

  LawyerServiceModel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? subtitle;
  String? fee;

  Data({this.id, this.title, this.subtitle, this.fee});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    fee = json['fee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['fee'] = fee;
    return data;
  }
}
