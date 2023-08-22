class Message {
  String? id;
  String? target;
  String? emitter;
  String? emitterId;
  String? to;
  String? from;
  String? subject;
  String? body;
  String? parentId;
  String? condominiumId;
  bool? isRead;
  String? attachment;
  String? visibility;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Message(
      {this.id,
      this.target,
      this.emitter,
      this.emitterId,
      this.to,
      this.from,
      this.subject,
      this.body,
      this.parentId,
      this.condominiumId,
      this.isRead,
      this.attachment,
      this.visibility,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json["Id"],
      target: json["Target"],
      emitter: json["Emitter"],
      emitterId: json["EmitterId"],
      to: json["To"],
      from: json["From"],
      subject: json["Subject"],
      body: json["Body"],
      parentId: json["ParentId"],
      condominiumId: json["CondominiumId"],
      isRead: json["IsRead"],
      attachment: json["Attachment"],
      visibility: json["Visibility"],
      createdAt: json["CreatedAt"],
      updatedAt: json["UpdatedAt"],
      deletedAt: json["DeletedAt"],
    );
  }

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Target": target,
        "Emitter": emitter,
        "EmitterId": emitterId,
        "To": to,
        "From": from,
        "Subject": subject,
        "Body": body,
        "ParentId": parentId,
        "CondominiumId": condominiumId,
        "IsRead": isRead,
        "Attachment": attachment,
        "Visibility": visibility,
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt,
        "deletedAt": deletedAt
      };
}
