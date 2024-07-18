class ClientSideClientTransModel {
  String? message;
  int? respnseCode;
  int? count;
  int? currentPage;
  int? totalPages;
  List<Data>? data;

  ClientSideClientTransModel(
      {this.message,
        this.respnseCode,
        this.count,
        this.currentPage,
        this.totalPages,
        this.data});

  ClientSideClientTransModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    respnseCode = json['respnse_code'];
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
    data['respnse_code'] = respnseCode;
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
  String? lawyerName;
  String? serviceFee;
  String? serviceName;
  String? paymentNo;
  String? paymentMethod;
  String? createdDate;
  String? updatedDate;
  String? status;
  double? paymentAmount;
  double? likhitDeCommission;
  double? gatewayCommission;
  double? splitCharge;
  double? likhitDeNetAmt;
  double? likhitGstAmt;
  double? likhitTotalAmtGst;
  double? getwayAmt;
  double? getwayGstAmt;
  double? getwayTotalAmtGst;
  double? splitAmt;
  double? splitGstAmt;
  double? splitTotalAmtGst;
  double? totalDeductionFromLikhitDe;
  double? payableAmountToLawyerAfterCharge;
  String? paymentFor;
  int? lawyer;
  int? service;
  int? client;

  Data(
      {this.id,
        this.lawyerName,
        this.serviceFee,
        this.serviceName,
        this.paymentNo,
        this.paymentMethod,
        this.createdDate,
        this.updatedDate,
        this.status,
        this.paymentAmount,
        this.likhitDeCommission,
        this.gatewayCommission,
        this.splitCharge,
        this.likhitDeNetAmt,
        this.likhitGstAmt,
        this.likhitTotalAmtGst,
        this.getwayAmt,
        this.getwayGstAmt,
        this.getwayTotalAmtGst,
        this.splitAmt,
        this.splitGstAmt,
        this.splitTotalAmtGst,
        this.totalDeductionFromLikhitDe,
        this.payableAmountToLawyerAfterCharge,
        this.paymentFor,
        this.lawyer,
        this.service,
        this.client});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lawyerName = json['lawyer_name'];
    serviceFee = json['service_fee'];
    serviceName = json['service_name'];
    paymentNo = json['payment_no'];
    paymentMethod = json['payment_method'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    status = json['status'];
    paymentAmount = json['payment_amount'];
    likhitDeCommission = json['likhit_de_commission'];
    gatewayCommission = json['gateway_commission'];
    splitCharge = json['split_charge'];
    likhitDeNetAmt = json['likhit_de_net_amt'];
    likhitGstAmt = json['likhit_gst_amt'];
    likhitTotalAmtGst = json['likhit_total_amt_gst'];
    getwayAmt = json['getway_amt'];
    getwayGstAmt = json['getway_gst_amt'];
    getwayTotalAmtGst = json['getway_total_amt_gst'];
    splitAmt = json['split_amt'];
    splitGstAmt = json['split_gst_amt'];
    splitTotalAmtGst = json['split_total_amt_gst'];
    totalDeductionFromLikhitDe = json['total_deduction_from_likhit_de'];
    payableAmountToLawyerAfterCharge =
    json['payable_amount_to_lawyer_after_charge'];
    paymentFor = json['payment_for'];
    lawyer = json['lawyer'];
    service = json['service'];
    client = json['client'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['lawyer_name'] = lawyerName;
    data['service_fee'] = serviceFee;
    data['service_name'] = serviceName;
    data['payment_no'] = paymentNo;
    data['payment_method'] = paymentMethod;
    data['created_date'] = createdDate;
    data['updated_date'] = updatedDate;
    data['status'] = status;
    data['payment_amount'] = paymentAmount;
    data['likhit_de_commission'] = likhitDeCommission;
    data['gateway_commission'] = gatewayCommission;
    data['split_charge'] = splitCharge;
    data['likhit_de_net_amt'] = likhitDeNetAmt;
    data['likhit_gst_amt'] = likhitGstAmt;
    data['likhit_total_amt_gst'] = likhitTotalAmtGst;
    data['getway_amt'] = getwayAmt;
    data['getway_gst_amt'] = getwayGstAmt;
    data['getway_total_amt_gst'] = getwayTotalAmtGst;
    data['split_amt'] = splitAmt;
    data['split_gst_amt'] = splitGstAmt;
    data['split_total_amt_gst'] = splitTotalAmtGst;
    data['total_deduction_from_likhit_de'] = totalDeductionFromLikhitDe;
    data['payable_amount_to_lawyer_after_charge'] =
        payableAmountToLawyerAfterCharge;
    data['payment_for'] = paymentFor;
    data['lawyer'] = lawyer;
    data['service'] = service;
    data['client'] = client;
    return data;
  }
}
