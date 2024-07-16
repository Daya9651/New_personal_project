class LawyerListModel {
  String? message;
  int? responseCode;
  int? count;
  int? currentPage;
  int? totalPages;
  List<LawyerListData>? data;

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
      data = <LawyerListData>[];
      json['data'].forEach((v) {
        data!.add(new LawyerListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['response_code'] = this.responseCode;
    data['count'] = this.count;
    data['current_page'] = this.currentPage;
    data['total_pages'] = this.totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LawyerListData {
  int? id;
  String? name;
  String? address;
  List<String>? specialties;
  List<String>? languageSpoken;
  String? experience;
  String? image;
  int? avgRating;

  LawyerListData(
      {this.id,
      this.name,
      this.address,
      this.specialties,
      this.languageSpoken,
      this.experience,
      this.image,
      this.avgRating});

  LawyerListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    specialties = json['specialties'].cast<String>();
    languageSpoken = json['language_spoken'].cast<String>();
    experience = json['experience'];
    image = json['image'];
    avgRating = json['avg_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['specialties'] = this.specialties;
    data['language_spoken'] = this.languageSpoken;
    data['experience'] = this.experience;
    data['image'] = this.image;
    data['avg_rating'] = this.avgRating;
    return data;
  }
}
