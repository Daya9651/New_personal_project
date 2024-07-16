class ClientListModel {
  String? message;
  int? responseCode;
  int? totalClients;
  int? currentPage;
  int? totalPages;
  List<Data>? data;

  ClientListModel(
      {this.message,
        this.responseCode,
        this.totalClients,
        this.currentPage,
        this.totalPages,
        this.data});

  ClientListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    responseCode = json['response_code'];
    totalClients = json['total_clients'];
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
    data['total_clients'] = totalClients;
    data['current_page'] = currentPage;
    data['total_pages'] = totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? clientId;
  String? clientName;
  String? clientEmail;

  Data({this.clientId, this.clientName, this.clientEmail});

  Data.fromJson(Map<String, dynamic> json) {
    clientId = json['client__id'];
    clientName = json['client__name'];
    clientEmail = json['client__email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['client__id'] = clientId;
    data['client__name'] = clientName;
    data['client__email'] = clientEmail;
    return data;
  }
}
