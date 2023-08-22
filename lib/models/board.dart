import 'package:condo_app/models/models.dart';

class Board {
  final String? id;
  final String? target;
  final List<String>? to;
  final String? from;
  final String? subject;
  final String? body;
  final String? condominiumId;
  final String? attachment;
  final String? visibility;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;
  final String? identifier;
  final Finca? recipient;
  // final Person? sender;

  Board({
    this.id,
    this.target,
    this.to,
    this.from,
    this.subject,
    this.body,
    this.condominiumId,
    this.attachment,
    this.visibility,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.identifier,
    this.recipient,
    // this.sender,
  });

  factory Board.fromJson(Map<String, dynamic> json) => Board(
        id: json["Id"],
        target: json["Target"],
        to: json["To"] == null
            ? []
            : List<String>.from(json["To"]!.map((x) => x)),
        from: json["From"],
        subject: json["Subject"],
        body: json["Body"],
        condominiumId: json["CondominiumId"],
        attachment: json["Attachment"],
        visibility: json["Visibility"],
        createdAt: json["CreatedAt"],
        updatedAt: json["UpdatedAt"],
        deletedAt: json["DeletedAt"],
        identifier: json["Identifier"],
        recipient: json["Recipient"] == null
            ? null
            : Finca.fromJson(json["Recipient"]),
        // sender: json["Sender"] == null ? null : Person.fromJson(json["Sender"]),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Target": target,
        "To": to == null ? [] : List<dynamic>.from(to!.map((x) => x)),
        "From": from,
        "Subject": subject,
        "Body": body,
        "CondominiumId": condominiumId,
        "Attachment": attachment,
        "Visibility": visibility,
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt,
        "DeletedAt": deletedAt,
        "Identifier": identifier,
        "Recipient": recipient?.toJson(),
        // "Sender": sender?.toJson(),
      };
}
