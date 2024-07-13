class LawyerPlanModel {
  int? responseCode;
  Plan? plan;
  List<PlanPrices>? planPrices;
  bool? free;

  LawyerPlanModel({this.responseCode, this.plan, this.planPrices, this.free});

  LawyerPlanModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    plan = json['plan'] != null ? new Plan.fromJson(json['plan']) : null;
    if (json['plan_prices'] != null) {
      planPrices = <PlanPrices>[];
      json['plan_prices'].forEach((v) {
        planPrices!.add(new PlanPrices.fromJson(v));
      });
    }
    free = json['free'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response_code'] = responseCode;
    if (plan != null) {
      data['plan'] = plan!.toJson();
    }
    if (planPrices != null) {
      data['plan_prices'] = planPrices!.map((v) => v.toJson()).toList();
    }
    data['free'] = free;
    return data;
  }
}

class Plan {
  int? id;
  String? title;
  String? type;
  String? image;
  String? descriptions;
  bool? isActivate;
  String? isCreated;

  Plan(
      {this.id,
        this.title,
        this.type,
        this.image,
        this.descriptions,
        this.isActivate,
        this.isCreated});

  Plan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    image = json['image'];
    descriptions = json['descriptions'];
    isActivate = json['is_activate'];
    isCreated = json['is_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['type'] = type;
    data['image'] = image;
    data['descriptions'] = descriptions;
    data['is_activate'] = isActivate;
    data['is_created'] = isCreated;
    return data;
  }
}

class PlanPrices {
  int? id;
  String? plan;
  String? type;
  String? price;
  int? discount;
  int? gst;
  int? gatewayFee;
  double? delhiveryCharge;
  String? typeImage;
  bool? isActivate;
  String? isCreated;
  double? discountPrice;

  PlanPrices(
      {this.id,
        this.plan,
        this.type,
        this.price,
        this.discount,
        this.gst,
        this.gatewayFee,
        this.delhiveryCharge,
        this.typeImage,
        this.isActivate,
        this.isCreated,
        this.discountPrice});

  PlanPrices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    plan = json['plan'];
    type = json['type'];
    price = json['price'];
    discount = json['discount'];
    gst = json['gst'];
    gatewayFee = json['gateway_fee'];
    delhiveryCharge = json['delhivery_charge'];
    typeImage = json['type_image'];
    isActivate = json['is_activate'];
    isCreated = json['is_created'];
    discountPrice = json['discount_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['plan'] = plan;
    data['type'] = type;
    data['price'] = price;
    data['discount'] = discount;
    data['gst'] = gst;
    data['gateway_fee'] = gatewayFee;
    data['delhivery_charge'] = delhiveryCharge;
    data['type_image'] = typeImage;
    data['is_activate'] = isActivate;
    data['is_created'] = isCreated;
    data['discount_price'] = discountPrice;
    return data;
  }
}
