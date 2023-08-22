import 'package:intl/intl.dart';

class Visitor {
  final String? id;
  final String? typeIdentification;
  final String? identification;
  final String? nameVisitor;
  final String? description;
  final String? userId;
  final String? propertyId;
  final String? dateVisit;
  final Check? checkIn;
  final Check? checkOut;
  final dynamic agentId;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;

  Visitor({
    this.id,
    this.typeIdentification,
    this.identification,
    this.nameVisitor,
    this.description,
    this.userId,
    this.propertyId,
    this.dateVisit,
    this.checkIn,
    this.checkOut,
    this.agentId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Visitor.fromJson(Map<String, dynamic> json) {
    return Visitor(
      id: json["Id"],
      typeIdentification: json["TypeIdentification"] == "CED"
          ? "Cédula"
          : json["TypeIdentification"],
      identification: json["Identification"],
      nameVisitor: json["NameVisitor"],
      description: json["Description"],
      userId: json["UserId"],
      propertyId: json["PropertyId"],
      dateVisit: json["DateVisit"],
      checkIn: json["CheckIn"] == null ? null : Check.fromJson(json["CheckIn"]),
      checkOut:
          json["CheckOut"] == null ? null : Check.fromJson(json["CheckOut"]),
      agentId: json["AgentId"],
      createdAt: json["CreatedAt"],
      updatedAt: json["UpdatedAt"],
      deletedAt: json["DeletedAt"],
    );
  }

  Map<String, dynamic> toJson() => {
        "Id": id,
        "TypeIdentification": typeIdentification,
        "Identification": identification,
        "NameVisitor": nameVisitor,
        "Description": description,
        "UserId": userId,
        "PropertyId": propertyId,
        "DateVisit": dateVisit,
        "CheckIn": checkIn?.toJson(),
        "CheckOut": checkOut?.toJson(),
        "AgentId": agentId,
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt,
        "DeletedAt": deletedAt,
      };
}

class Check {
  Check();

  factory Check.fromJson(Map<String, dynamic> json) => Check();

  Map<String, dynamic> toJson() => {};
}
