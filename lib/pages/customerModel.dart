import 'package:flutter/material.dart';
import 'dart:convert';
// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    required this.success,
    required this.customerDetails,
    required this.error,
  });

  bool success;
  CustomerDetails customerDetails;
  bool error;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        success: json["success"],
        customerDetails: CustomerDetails.fromJson(json["customer_details"]),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "customer_details": customerDetails.toJson(),
        "error": error,
      };
}

class CustomerDetails {
  CustomerDetails({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.createdAt,
  });

  String id;
  String fullName;
  String email;
  String phone;
  String createdAt;

  factory CustomerDetails.fromJson(Map<String, dynamic> json) =>
      CustomerDetails(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        phone: json["phone"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "phone": phone,
        "created_at": createdAt,
      };
}
