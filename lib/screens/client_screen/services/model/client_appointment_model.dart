class ClientAppointmentModel {
  String? message;
  int? responseCode;
  int? appointmentReceived;
  int? appointmentAccepted;
  int? appointmentPending;
  int? appointmentDenied;
  int? currentPage;
  int? totalPages;
  List<ClientAppointmentData>? data;

  ClientAppointmentModel(
      {this.message,
      this.responseCode,
      this.appointmentReceived,
      this.appointmentAccepted,
      this.appointmentPending,
      this.appointmentDenied,
      this.currentPage,
      this.totalPages,
      this.data});

  ClientAppointmentModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    responseCode = json['response_code'];
    appointmentReceived = json['appointment_received'];
    appointmentAccepted = json['appointment_accepted'];
    appointmentPending = json['appointment_pending'];
    appointmentDenied = json['appointment_denied'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <ClientAppointmentData>[];
      json['data'].forEach((v) {
        data!.add(new ClientAppointmentData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['response_code'] = this.responseCode;
    data['appointment_received'] = this.appointmentReceived;
    data['appointment_accepted'] = this.appointmentAccepted;
    data['appointment_pending'] = this.appointmentPending;
    data['appointment_denied'] = this.appointmentDenied;
    data['current_page'] = this.currentPage;
    data['total_pages'] = this.totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClientAppointmentData {
  int? id;
  String? lawyerImage;
  String? lawyerName;
  String? date;
  String? time;
  String? name;
  String? email;
  String? content;
  int? phoneNo;
  String? status;
  String? paymentNo;
  String? paymentMethod;
  double? paymentAmount;
  String? paymentStatus;
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
  double? likhitDeNetProfitAmt;
  double? likhitDeNetProfitGstAmt;
  double? likhitDeTotalNetProfitAmtGst;
  double? payableAmountToLawyerAfterCharge;
  String? createdDate;
  String? updatedDate;
  int? lawyer;
  int? client;
  int? service;

  ClientAppointmentData(
      {this.id,
      this.lawyerImage,
      this.lawyerName,
      this.date,
      this.time,
      this.name,
      this.email,
      this.content,
      this.phoneNo,
      this.status,
      this.paymentNo,
      this.paymentMethod,
      this.paymentAmount,
      this.paymentStatus,
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
      this.likhitDeNetProfitAmt,
      this.likhitDeNetProfitGstAmt,
      this.likhitDeTotalNetProfitAmtGst,
      this.payableAmountToLawyerAfterCharge,
      this.createdDate,
      this.updatedDate,
      this.lawyer,
      this.client,
      this.service});

  ClientAppointmentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lawyerImage = json['lawyer_image'];
    lawyerName = json['lawyer_name'];
    date = json['date'];
    time = json['time'];
    name = json['name'];
    email = json['email'];
    content = json['content'];
    phoneNo = json['phone_no'];
    status = json['status'];
    paymentNo = json['payment_no'];
    paymentMethod = json['payment_method'];
    paymentAmount = json['payment_amount'];
    paymentStatus = json['payment_status'];
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
    likhitDeNetProfitAmt = json['likhit_de_net_profit_amt'];
    likhitDeNetProfitGstAmt = json['likhit_de_net_profit_gst_amt'];
    likhitDeTotalNetProfitAmtGst = json['likhit_de_total_net_profit_amt_gst'];
    payableAmountToLawyerAfterCharge =
        json['payable_amount_to_lawyer_after_charge'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    lawyer = json['lawyer'];
    client = json['client'];
    service = json['service'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lawyer_image'] = this.lawyerImage;
    data['lawyer_name'] = this.lawyerName;
    data['date'] = this.date;
    data['time'] = this.time;
    data['name'] = this.name;
    data['email'] = this.email;
    data['content'] = this.content;
    data['phone_no'] = this.phoneNo;
    data['status'] = this.status;
    data['payment_no'] = this.paymentNo;
    data['payment_method'] = this.paymentMethod;
    data['payment_amount'] = this.paymentAmount;
    data['payment_status'] = this.paymentStatus;
    data['likhit_de_commission'] = this.likhitDeCommission;
    data['gateway_commission'] = this.gatewayCommission;
    data['split_charge'] = this.splitCharge;
    data['likhit_de_net_amt'] = this.likhitDeNetAmt;
    data['likhit_gst_amt'] = this.likhitGstAmt;
    data['likhit_total_amt_gst'] = this.likhitTotalAmtGst;
    data['getway_amt'] = this.getwayAmt;
    data['getway_gst_amt'] = this.getwayGstAmt;
    data['getway_total_amt_gst'] = this.getwayTotalAmtGst;
    data['split_amt'] = this.splitAmt;
    data['split_gst_amt'] = this.splitGstAmt;
    data['split_total_amt_gst'] = this.splitTotalAmtGst;
    data['total_deduction_from_likhit_de'] = this.totalDeductionFromLikhitDe;
    data['likhit_de_net_profit_amt'] = this.likhitDeNetProfitAmt;
    data['likhit_de_net_profit_gst_amt'] = this.likhitDeNetProfitGstAmt;
    data['likhit_de_total_net_profit_amt_gst'] =
        this.likhitDeTotalNetProfitAmtGst;
    data['payable_amount_to_lawyer_after_charge'] =
        this.payableAmountToLawyerAfterCharge;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    data['lawyer'] = this.lawyer;
    data['client'] = this.client;
    data['service'] = this.service;
    return data;
  }
}
