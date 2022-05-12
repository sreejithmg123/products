class Responses {
  bool? status;
  dynamic data;
  int? count;
  String? message;

  Responses({this.status, this.data, this.count, this.message});

  Responses.fromJson(Map<String, dynamic> json) {
    status = json['success'] ?? !json['error'];
    data = json['data'];
    count = json['count'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['count'] = count;
    data['message'] = message;
    return data;
  }
}
