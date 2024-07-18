class ClientReviewForLawyerModel {
  int? responseCode;
  List<Data>? data;

  ClientReviewForLawyerModel({this.responseCode, this.data});

  ClientReviewForLawyerModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response_code'] = responseCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? userName;
  int? lawyer;
  String? isCreated;
  String? image;
  int? rating;
  String? comment;
  String? likeDisLikeStatus;
  int? likeCount;
  int? dislikeCount;

  Data(
      {this.id,
        this.userName,
        this.lawyer,
        this.isCreated,
        this.image,
        this.rating,
        this.comment,
        this.likeDisLikeStatus,
        this.likeCount,
        this.dislikeCount});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    lawyer = json['lawyer'];
    isCreated = json['is_created'];
    rating = json['rating'];
    comment = json['comment'];
    image = json['image'];
    likeDisLikeStatus = json['like_dislike_status'];
    likeCount = json['like_count'];
    dislikeCount = json['dislike_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_name'] = userName;
    data['lawyer'] = lawyer;
    data['image'] = image;
    data['is_created'] = isCreated;
    data['rating'] = rating;
    data['like_dislike_status'] = likeDisLikeStatus;
    data['comment'] = comment;
    data['like_count'] = likeCount;
    data['dislike_count'] = dislikeCount;
    return data;
  }
}
