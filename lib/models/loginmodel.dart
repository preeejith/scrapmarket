class LoginModel {
  bool? status;
  String? token;
  String? role;
  String? id;
  String? userName;
  String? msg;

  LoginModel(
      {this.status, this.token, this.role, this.id, this.userName, this.msg});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    role = json['role'];
    id = json['id'];
    userName = json['userName'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['token'] = token;
    data['role'] = role;
    data['id'] = id;
    data['userName'] = userName;
    data['msg'] = msg;
    return data;
  }
}
