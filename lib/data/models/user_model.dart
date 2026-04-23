class UserModel {
  String? email;
  String? firstName;
  String? lastName;
  String? mobile;
  String? createdDate;
  String? sId;

  UserModel({
    this.email,
    this.firstName,
    this.lastName,
    this.mobile,
    this.createdDate,
    this.sId,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobile = json['mobile'];
    createdDate = json['createdDate'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['mobile'] = this.mobile;
    data['createdDate'] = this.createdDate;
    data['_id'] = this.sId;
    return data;
  }
}
