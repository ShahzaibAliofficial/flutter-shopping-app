import 'review_model.dart';

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String thumbnail;
  final double rating;
  final String brand;
  final String description;
  final String category;
  final double discountPercentage;
  final int stock;
  final List<String> images;
  final String availabilityStatus;
  final String shippingInformation;
  final String warrantyInformation;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final String barcode;
  final String qrCode;
  final List<ReviewModel>reviews;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
    required this.rating,
    required this.brand,
    required this.category,
    required this.description,
    required this.images,
    required this.stock,
    required this.discountPercentage,
    required this.availabilityStatus,
    required this.minimumOrderQuantity,
    required this.returnPolicy,
    required this.shippingInformation,
    required this.warrantyInformation,
    required this.reviews,
    required this.barcode,
    required this.qrCode,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {

    return ProductModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      price: (json['price'] as num).toDouble(),
      thumbnail: json['thumbnail' ?? ''],
      rating: (json['rating'] as num ).toDouble(),
      brand: json['brand'] ?? '',
      category: json['category'] ?? '',
      description: json['description'] ?? '',
      images: List<String>.from(json['images']?? []),
      stock: json['stock'] ?? '',
      barcode: json['meta']?['barcode'] ?? '',
      qrCode: json['meta']['qrCode'],
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      availabilityStatus: json['availabilityStatus'] ?? '',
      minimumOrderQuantity: json['minimumOrderQuantity'] ?? '',
      returnPolicy: json['returnPolicy'] ?? '',
      shippingInformation: json['shippingInformation'] ?? '',
      warrantyInformation: json['warrantyInformation'] ?? '',
      reviews: (json['reviews'] as List).map((e) => ReviewModel.fromJson(e)).toList()
    );
  }
}
