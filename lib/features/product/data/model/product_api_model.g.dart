// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductAPIModel _$ProductAPIModelFromJson(Map<String, dynamic> json) =>
    ProductAPIModel(
      productPrice: json['productPrice'] as int,
      productDescription: json['productDescription'] as String,
      productCategory: json['productCategory'] as String,
      productImageUrl: json['productImageUrl'] as String,
      productId: json['_id'] as String?,
      productName: json['productName'] as String,
    );

Map<String, dynamic> _$ProductAPIModelToJson(ProductAPIModel instance) =>
    <String, dynamic>{
      '_id': instance.productId,
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'productDescription': instance.productDescription,
      'productCategory': instance.productCategory,
      'productImageUrl': instance.productImageUrl,
    };
