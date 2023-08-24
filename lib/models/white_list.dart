// class WhiteList {
//     String status;
//     List<Result> result;

//     WhiteList({
//         required this.status,
//         required this.result,
//     });

//     factory WhiteList.fromJson(Map<String, dynamic> json) => WhiteList(
//         status: json["Status"],
//         result: List<Result>.from(json["Result"].map((x) => Result.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "Status": status,
//         "Result": List<dynamic>.from(result.map((x) => x.toJson())),
//     };
// }

import 'package:condo_app/models/models.dart';

class WhiteList {
  String id;
  String typeIdentification;
  String identification;
  String fullName;
  String description;
  bool provider;
  String userId;
  String propertyId;
  List<Report> reports;
  String? createdAt;
  String? updatedAt;
  String? condominiumId;
  String? plate;
  dynamic deletedAt;
  Finca property;

  WhiteList({
    required this.id,
    required this.typeIdentification,
    required this.identification,
    required this.fullName,
    required this.description,
    required this.provider,
    required this.userId,
    required this.propertyId,
    required this.reports,
    required this.createdAt,
    required this.updatedAt,
    required this.condominiumId,
    required this.plate,
    required this.deletedAt,
    required this.property,
  });

  factory WhiteList.fromJson(Map<String, dynamic> json) => WhiteList(
        id: json["Id"],
        typeIdentification: json["TypeIdentification"],
        identification: json["Identification"],
        fullName: json["FullName"],
        description: json["Description"],
        provider: json["Provider"],
        userId: json["UserId"],
        propertyId: json["PropertyId"],
        reports:
            List<Report>.from(json["Reports"].map((x) => Report.fromJson(x))),
        createdAt: json["CreatedAt"],
        updatedAt: json["UpdatedAt"],
        condominiumId: json["CondominiumId"],
        plate: json["Plate"],
        deletedAt: json["DeletedAt"],
        property: Finca.fromJson(json["Property"]),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "TypeIdentification": typeIdentification,
        "Identification": identification,
        "FullName": fullName,
        "Description": description,
        "Provider": provider,
        "UserId": userId,
        "PropertyId": propertyId,
        "Reports": List<Report>.from(reports.map((x) => x.toJson())),
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt,
        "CondominiumId": condominiumId,
        "Plate": plate,
        "DeletedAt": deletedAt,
        "Property": property.toJson(),
      };
}

// class Property {
//   String id;
//   int habitants;
//   String condominiumId;
//   bool rented;
//   String propertyNumber;
//   String telephone;
//   List<PropertyReport> reports;
//   List<User> users;
//   String createdAt;
//   String updatedAt;
//   dynamic deletedAt;
//   dynamic inhabited;
//   dynamic notes;

//   Property({
//     required this.id,
//     required this.habitants,
//     required this.condominiumId,
//     required this.rented,
//     required this.propertyNumber,
//     required this.telephone,
//     required this.reports,
//     required this.users,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.deletedAt,
//     required this.inhabited,
//     required this.notes,
//   });

//   factory Property.fromJson(Map<String, dynamic> json) => Property(
//         id: json["Id"],
//         habitants: json["Habitants"],
//         condominiumId: json["CondominiumId"],
//         rented: json["Rented"],
//         propertyNumber: json["PropertyNumber"],
//         telephone: json["Telephone"],
//         reports: List<PropertyReport>.from(
//             json["Reports"].map((x) => PropertyReport.fromJson(x))),
//         users: List<User>.from(json["Users"].map((x) => User.fromJson(x))),
//         createdAt: json["CreatedAt"],
//         updatedAt: json["UpdatedAt"],
//         deletedAt: json["DeletedAt"],
//         inhabited: json["Inhabited"],
//         notes: json["Notes"],
//       );

//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "Habitants": habitants,
//         "CondominiumId": condominiumId,
//         "Rented": rented,
//         "PropertyNumber": propertyNumber,
//         "Telephone": telephone,
//         "Reports": List<dynamic>.from(reports.map((x) => x.toJson())),
//         "Users": List<dynamic>.from(users.map((x) => x.toJson())),
//         "CreatedAt": createdAt,
//         "UpdatedAt": updatedAt,
//         "DeletedAt": deletedAt,
//         "Inhabited": inhabited,
//         "Notes": notes,
//       };
// }

// class PropertyReport {
//   String observation;
//   DateTime date;

//   PropertyReport({
//     required this.observation,
//     required this.date,
//   });

//   factory PropertyReport.fromJson(Map<String, dynamic> json) => PropertyReport(
//         observation: json["Observation"],
//         date: DateTime.parse(json["Date"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "Observation": observation,
//         "Date": date.toIso8601String(),
//       };
// }

// class User {
//   bool active;
//   String userType;
//   String lastUpdate;
//   Person person;
//   String userId;
//   String userIdentification;
//   String userName;
//   String userEmail;
//   String userPhone;

//   User({
//     required this.active,
//     required this.userType,
//     required this.lastUpdate,
//     required this.person,
//     required this.userId,
//     required this.userIdentification,
//     required this.userName,
//     required this.userEmail,
//     required this.userPhone,
//   });

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         active: json["Active"],
//         userType: json["UserType"],
//         lastUpdate: json["LastUpdate"],
//         person: Person.fromJson(json["Person"]),
//         userId: json["UserId"],
//         userIdentification: json["UserIdentification"],
//         userName: json["UserName"],
//         userEmail: json["UserEmail"],
//         userPhone: json["UserPhone"],
//       );

//   Map<String, dynamic> toJson() => {
//         "Active": active,
//         "UserType": userType,
//         "LastUpdate": lastUpdate,
//         "Person": person.toJson(),
//         "UserId": userId,
//         "UserIdentification": userIdentification,
//         "UserName": userName,
//         "UserEmail": userEmail,
//         "UserPhone": userPhone,
//       };
// }

// class Person {
//   String email;
//   String telephone;
//   String createdAt;
//   String lastname2;
//   String lastname1;
//   String updatedAt;
//   String firstname;
//   String indentification;
//   String id;
//   dynamic deletedAt;
//   String indentificationType;
//   DateTime birthDate;
//   String password;

//   Person({
//     required this.email,
//     required this.telephone,
//     required this.createdAt,
//     required this.lastname2,
//     required this.lastname1,
//     required this.updatedAt,
//     required this.firstname,
//     required this.indentification,
//     required this.id,
//     required this.deletedAt,
//     required this.indentificationType,
//     required this.birthDate,
//     required this.password,
//   });

//   factory Person.fromJson(Map<String, dynamic> json) => Person(
//         email: json["Email"],
//         telephone: json["Telephone"],
//         createdAt: json["CreatedAt"],
//         lastname2: json["Lastname2"],
//         lastname1: json["Lastname1"],
//         updatedAt: json["UpdatedAt"],
//         firstname: json["Firstname"],
//         indentification: json["Indentification"],
//         id: json["Id"],
//         deletedAt: json["DeletedAt"],
//         indentificationType: json["IndentificationType"],
//         birthDate: DateTime.parse(json["BirthDate"]),
//         password: json["Password"],
//       );

//   Map<String, dynamic> toJson() => {
//         "Email": email,
//         "Telephone": telephone,
//         "CreatedAt": createdAt,
//         "Lastname2": lastname2,
//         "Lastname1": lastname1,
//         "UpdatedAt": updatedAt,
//         "Firstname": firstname,
//         "Indentification": indentification,
//         "Id": id,
//         "DeletedAt": deletedAt,
//         "IndentificationType": indentificationType,
//         "BirthDate": birthDate.toIso8601String(),
//         "Password": password,
//       };
// }

// class ResultReport {
//   String type;
//   String observations;
//   DateTime date;
//   String plate;

//   ResultReport({
//     required this.type,
//     required this.observations,
//     required this.date,
//     required this.plate,
//   });

//   factory ResultReport.fromJson(Map<String, dynamic> json) => ResultReport(
//         type: json["Type"],
//         observations: json["Observations"],
//         date: DateTime.parse(json["Date"]),
//         plate: json["Plate"],
//       );

//   Map<String, dynamic> toJson() => {
//         "Type": type,
//         "Observations": observations,
//         "Date": date.toIso8601String(),
//         "Plate": plate,
//       };
// }
