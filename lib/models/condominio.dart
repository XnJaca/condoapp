class Condominio {
  final String? id;
  final String? nameCondominium;
  final String? description;
  final String? administratorId;
  final String? accountantId;
  final String? logoUrl;
  final bool? commonAreas;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;

  Condominio({
    this.id,
    this.nameCondominium,
    this.description,
    this.administratorId,
    this.accountantId,
    this.logoUrl,
    this.commonAreas,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Condominio.fromJson(Map<String, dynamic> json) => Condominio(
        id: json["Id"],
        nameCondominium: json["NameCondominium"],
        description: json["Description"],
        administratorId: json["AdministratorId"],
        accountantId: json["AccountantId"],
        logoUrl: json["LogoUrl"],
        commonAreas: json["CommonAreas"],
        createdAt: json["CreatedAt"],
        updatedAt: json["UpdatedAt"],
        deletedAt: json["DeletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "NameCondominium": nameCondominium,
        "Description": description,
        "AdministratorId": administratorId,
        "AccountantId": accountantId,
        "LogoUrl": logoUrl,
        "CommonAreas": commonAreas,
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt,
        "DeletedAt": deletedAt,
      };
}
