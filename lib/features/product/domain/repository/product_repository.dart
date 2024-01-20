import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_shop/core/failure/failure.dart';
import 'package:meat_shop/features/product/data/repository/product_remote_repository.dart';
import 'package:meat_shop/features/product/domain/entity/product_entity.dart';

final productRepositoryProvider = Provider.autoDispose<ProductRepository>(
  (ref) {
      return ref.read(productRemoteRepositoryProvider);

    // if (ref.watch(connectivityStatusProvider) ==
    //     ConnectivityStatus.isConnected) {
    //   return ref.read(productRemoteRepositoryProvider);
    // } else {
    //   return ref.read(productLocalRepositoryProvider);
    // }
  },
); 

abstract class ProductRepository {
  Future<Either<Failure, bool>> addProduct(ProductEntity product);
  Future<Either<Failure, List<ProductEntity>>> getAllProduct(int page);
  Future<Either<Failure, List<ProductEntity>>> getSingleProductById(String productId);
  Future<Either<Failure, bool>> deleteProduct(String id);
  Future<Either<Failure, bool>> editProduct(String id);
}
