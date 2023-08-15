import 'package:condo_app/models/models.dart';
import 'package:condo_app/models/user.dart';

class Finca {
  final String? id;
  final int? habitants;
  final String? condominiumId;
  final bool? rented;
  final String? propertyNumber;
  final String? telephone;
  final List<Report>? reports;
  final List<User>? users;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;
  final Condominio? condominium;

  Finca({
    this.id,
    this.habitants,
    this.condominiumId,
    this.rented,
    this.propertyNumber,
    this.telephone,
    this.reports,
    this.users,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.condominium,
  });

  factory Finca.fromJson(Map<String, dynamic> json) => Finca(
        id: json["Id"],
        habitants: json["Habitants"],
        condominiumId: json["CondominiumId"],
        rented: json["Rented"],
        propertyNumber: json["PropertyNumber"],
        telephone: json["Telephone"],
        reports: json["Reports"] == null
            ? []
            : List<Report>.from(
                json["Reports"]!.map((x) => Report.fromJson(x))),
        users: json["Users"] == null
            ? []
            : List<User>.from(json["Users"].map((x) => User.fromJson(x))),
        createdAt: json["CreatedAt"],
        updatedAt: json["UpdatedAt"],
        deletedAt: json["DeletedAt"],
        condominium: json["Condominium"] == null
            ? null
            : Condominio.fromJson(json["Condominium"]),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Habitants": habitants,
        "CondominiumId": condominiumId,
        "Rented": rented,
        "PropertyNumber": propertyNumber,
        "Telephone": telephone,
        "Reports": reports == null
            ? []
            : List<dynamic>.from(reports!.map((x) => x.toJson())),
        "Users": users == null
            ? []
            : List<dynamic>.from(users!.map((x) => x.toJson())),
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt,
        "DeletedAt": deletedAt,
        "Condominium": condominium?.toJson(),
      };
}
