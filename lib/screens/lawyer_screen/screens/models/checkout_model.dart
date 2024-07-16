class CheckOutModel {
  String? message;
  int? responseCode;
  Data? data;

  CheckOutModel({this.message, this.responseCode, this.data});

  CheckOutModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    responseCode = json['response_code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['response_code'] = responseCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? lawyer;
  int? plan;
  double? totalPrice;
  int? discountPercentage;
  int? gstPercentage;
  double? discountAmount;
  double? gstAmount;
  int? payableAmount;
  String? planType;
  int? delhiveryAddress;
  int? couponamount;
  double? delhiveryCharge;

  Data(
      {this.lawyer,
        this.plan,
        this.totalPrice,
        this.discountPercentage,
        this.gstPercentage,
        this.discountAmount,
        this.gstAmount,
        this.payableAmount,
        this.planType,
        this.delhiveryAddress,
        this.couponamount,
        this.delhiveryCharge});

  Data.fromJson(Map<String, dynamic> json) {
    lawyer = json['lawyer'];
    plan = json['plan'];
    totalPrice = json['total_price'];
    discountPercentage = json['discount_percentage'];
    gstPercentage = json['gst_percentage'];
    discountAmount = json['discount_amount'];
    gstAmount = json['gst_amount'];
    payableAmount = json['payable_amount'];
    planType = json['plan_type'];
    delhiveryAddress = json['delhivery_address'];
    couponamount = json['couponamount'];
    delhiveryCharge = json['delhivery_charge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lawyer'] = lawyer;
    data['plan'] = plan;
    data['total_price'] = totalPrice;
    data['discount_percentage'] = discountPercentage;
    data['gst_percentage'] = gstPercentage;
    data['discount_amount'] = discountAmount;
    data['gst_amount'] = gstAmount;
    data['payable_amount'] = payableAmount;
    data['plan_type'] = planType;
    data['delhivery_address'] = delhiveryAddress;
    data['couponamount'] = couponamount;
    data['delhivery_charge'] = delhiveryCharge;
    return data;
  }
}
