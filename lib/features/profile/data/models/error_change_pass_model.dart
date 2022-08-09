class ErrorChangePassModel {
  String? type;
  String? title;
  int? status;
  String? detail;

  ErrorChangePassModel({this.type, this.title, this.status, this.detail});

  ErrorChangePassModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    status = json['status'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['title'] = title;
    data['status'] = status;
    data['detail'] = detail;
    return data;
  }
}