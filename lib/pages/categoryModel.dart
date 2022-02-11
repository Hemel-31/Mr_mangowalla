// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);
import 'package:flutter/material.dart';
import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
    CategoryModel({
        required this.name,
        required this.price,
        required this.origin,
        required this.img,
        required this.category,
    });

    String name;
    String price;
    String origin;
    String img;
    String category;

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        name: json["name"],
        price: json["price"],
        origin: json["origin"],
        img: json["img"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "origin": origin,
        "img": img,
        "category": category,
    };
}
