// Untuk mengonversi JSON data menjadi model Dart
//
//     final itemEntry = itemEntryFromJson(jsonString);

import 'dart:convert';

List<ItemEntry> itemEntryFromJson(String str) =>
    List<ItemEntry>.from(json.decode(str).map((x) => ItemEntry.fromJson(x)));

String itemEntryToJson(List<ItemEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemEntry {
  String model;
  String pk;
  Fields fields;

  ItemEntry({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory ItemEntry.fromJson(Map<String, dynamic> json) => ItemEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  int user;
  String name;
  int amount;
  String description;
  DateTime time;

  Fields({
    required this.user,
    required this.name,
    required this.amount,
    required this.description,
    required this.time,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        amount: json["amount"],
        description: json["description"],
        time: DateTime.parse(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "amount": amount,
        "description": description,
        "time":
            "${time.year.toString().padLeft(4, '0')}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')}",
      };
}
