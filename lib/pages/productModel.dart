import 'package:flutter/material.dart';
import 'dart:convert';


// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);


ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    ProductModel({
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

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
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
