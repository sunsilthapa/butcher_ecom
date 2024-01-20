import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_shop/core/failure/failure.dart';
import 'package:meat_shop/features/product/data/data_source/product_remote_data_source.dart';
import 'package:meat_shop/features/product/domain/entity/product_entity.dart';
import 'package:meat_shop/features/product/domain/repository/product_repository.dart';

final productRemoteRepositoryProvider = Provider.autoDispose<ProductRepository>(
  (ref) => ProductRemoteRepository(
    productRemoteDataSource: ref.read(productRemoteDataSourceProvider),
  ),
);

class ProductRemoteRepository implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRemoteRepository({required this.productRemoteDataSource});


  @override
  Future<Either<Failure, bool>> deleteProduct(String id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> editProduct(String id) {
    // TODO: implement editProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProduct() {
    // TODO: implement getAllProduct
    return productRemoteDataSource.getAllProduct();
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getSingleProductById(String productId) {
    // TODO: implement getSingleProductById
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, bool>> addProduct(ProductEntity product) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }

 
}
