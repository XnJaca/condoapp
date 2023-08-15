import 'package:condo_app/models/models.dart';

class User {
  final bool? active;
  final String? userType;
  final String? lastUpdate;
  final Person? person;
  final String? userId;
  final String? userIdentification;
  final String? userName;
  final String? userEmail;
  final String? userPhone;

  User({
    this.active,
    this.userType,
    this.lastUpdate,
    this.person,
    this.userId,
    this.userIdentification,
    this.userName,
    this.userEmail,
    this.userPhone,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        active: json["Active"],
        userType: json["UserType"],
        lastUpdate: json["LastUpdate"],
        person: json["Person"] == null ? null : Person.fromJson(json["Person"]),
        userId: json["UserId"],
        userIdentification: json["UserIdentification"],
        userName: json["UserName"],
        userEmail: json["UserEmail"],
        userPhone: json["UserPhone"],
      );

  Map<String, dynamic> toJson() => {
        "Active": active,
        "UserType": userType,
        "LastUpdate": lastUpdate,
        "Person": person?.toJson(),
        "UserId": userId,
        "UserIdentification": userIdentification,
        "UserName": userName,
        "UserEmail": userEmail,
        "UserPhone": userPhone,
      };
}
