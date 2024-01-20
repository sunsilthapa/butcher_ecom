import 'package:json_annotation/json_annotation.dart';
import 'package:meat_shop/features/product/domain/entity/product_entity.dart';

part 'product_api_model.g.dart';

@JsonSerializable()
class ProductAPIModel {
  @JsonKey(name: '_id')
  final String? productId;
  final String productName;
  final int productPrice;
  final String productDescription;
  final String productCategory;
  final String productImageUrl;

  ProductAPIModel(
      {required this.productPrice,
      required this.productDescription,
      required this.productCategory,
      required this.productImageUrl,
      this.productId,
      required this.productName});

  factory ProductAPIModel.fromJson(Map<String, dynamic> json) =>
      _$ProductAPIModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductAPIModelToJson(this);

  // From entity to model
  factory ProductAPIModel.fromEntity(ProductEntity entity) {
    return ProductAPIModel(
      productId: entity.productId,
      productName: entity.productName,
      productPrice: entity.productPrice,
      productDescription: entity.productDescription,
      productCategory: entity.productCategory,
      productImageUrl: entity.productImageUrl,
    );
  }

  // From model to entity
  static ProductEntity toEntity(ProductAPIModel model) {
    return ProductEntity(
      productId: model.productId,
      productName: model.productName,
      productPrice: model.productPrice,
      productDescription: model.productDescription,
      productCategory: model.productCategory,
      productImageUrl: model.productImageUrl,
    );
  }
}
