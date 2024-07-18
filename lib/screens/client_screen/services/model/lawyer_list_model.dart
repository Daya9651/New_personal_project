class LawyerListModel {
  String? message;
  int? responseCode;
  int? count;
  int? currentPage;
  int? totalPages;
  List<Data>? data;

  LawyerListModel(
      {this.message,
      this.responseCode,
      this.count,
      this.currentPage,
      this.totalPages,
      this.data});

  LawyerListModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? address;
  List<String>? specialties;
  List<String>? languageSpoken;
  String? experience;
  String? image;
  double? avgRating;

  // double? avgRating;

  Data({
    this.id,
    this.name,
    this.address,
    this.specialties,
    this.languageSpoken,
    this.experience,
    this.image,
    // this.avgRating
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    specialties = json['specialties'].cast<String>();
    languageSpoken = json['language_spoken'].cast<String>();
    experience = json['experience'];
    image = json['image'];
    // avgRating = json['avg_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['specialties'] = specialties;
    data['language_spoken'] = languageSpoken;
    data['experience'] = experience;
    data['image'] = image;
    // data['avg_rating'] = avgRating;
    return data;
  }
}
