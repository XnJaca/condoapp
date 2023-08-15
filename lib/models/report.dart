class Report {
  final String? observation;
  final DateTime? date;

  Report({
    this.observation,
    this.date,
  });

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        observation: json["Observation"],
        date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
      );

  Map<String, dynamic> toJson() => {
        "Observation": observation,
        "Date": date?.toIso8601String(),
      };
}
