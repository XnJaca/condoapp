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
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json["Id"],
        indentificationType: json["IndentificationType"],
        indentification: json["Indentification"],
        firstname: json["Firstname"],
        lastname1: json["Lastname1"],
        lastname2: json["Lastname2"],
        email: json["Email"],
        telephone: json["Telephone"],
        birthDate: json["BirthDate"] == null
            ? null
            : DateTime.parse(json["BirthDate"]),
        createdAt: json["CreatedAt"],
        updatedAt: json["UpdatedAt"],
        deletedAt: json["DeletedAt"],
        password: json["Password"],
        role: json["Role"],
        token: json["Token"],
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
      };
}
