class Person {
  final String id;
  final String indentificationType;
  final String indentification;
  final String firstname;
  final String lastname1;
  final String lastname2;
  final String email;
  final String telephone;
  final DateTime? birthDate;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final String password;
  final String? role;
  final String? newPassword;
  String? token;

  Person({
    required this.id,
    required this.indentificationType,
    required this.indentification,
    required this.firstname,
    required this.lastname1,
    required this.lastname2,
    required this.email,
    required this.telephone,
    required this.birthDate,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.password,
    required this.role,
    this.token,
    this.newPassword,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json["Id"] ?? json["id"],
        indentificationType: json["IndentificationType"] ??
            json["indentificationType"] ??
            json["IdentificationType"],
        indentification: json["Indentification"] ??
            json["indentification"] ??
            json["Identification"],
        firstname: json["Firstname"] ?? json["firstname"],
        lastname1: json["Lastname1"] ?? json["lastName1"] ?? json["lastname1"],
        lastname2: json["Lastname2"] ?? json["lastName2"] ?? json["lastname2"],
        email: json["Email"] ?? json["email"],
        telephone:
            json["Telephone"] ?? json["telephone"] ?? json["phoneNumber"],
        birthDate: json["BirthDate"] == null
            ? null
            : DateTime.parse(json["BirthDate"] ?? json["birthDate"]),
        createdAt: json["CreatedAt"] ?? json["createdAt"],
        updatedAt: json["UpdatedAt"] ?? json["updatedAt"],
        deletedAt: json["DeletedAt"] ?? json["deletedAt"],
        password: json["Password"] ?? json["password"],
        role: json["Role"] ?? json["role"],
        token: json["Token"] ?? json["token"],
        newPassword: json["NewPassword"] ?? json["newPassword"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "IndentificationType": indentificationType,
        "Indentification": indentification,
        "Firstname": firstname,
        "Lastname1": lastname1,
        "Lastname2": lastname2,
        "Email": email,
        "Telephone": telephone,
        "BirthDate": birthDate?.toIso8601String(),
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt,
        "DeletedAt": deletedAt,
        "Password": password,
        "Role": role,
        "Token": token,
        "NewPassword": newPassword,
      };
}
