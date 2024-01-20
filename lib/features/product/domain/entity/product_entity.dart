// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? productId;
  final String productName;
  final int productPrice;
  final String productDescription;
  final String productCategory;
  final String productImageUrl;

  const ProductEntity(
      {this.productId,
      required this.productName,
      required this.productPrice,
      required this.productDescription,
      required this.productCategory,
      required this.productImageUrl});

  @override
  String toString() {
    return 'ProductEntity(productId: $productId, productName: $productName, productPrice: $productPrice, productDescription: $productDescription, productCategory: $productCategory, productImageurl: $productImageUrl)';
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}
