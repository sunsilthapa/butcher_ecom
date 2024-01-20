import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_shop/core/failure/failure.dart';
import 'package:meat_shop/features/product/domain/entity/product_entity.dart';
import 'package:meat_shop/features/product/domain/repository/product_repository.dart';

final addProductUseCaseProvider = Provider.autoDispose<AddProductUseCase>(
  (ref) =>
      AddProductUseCase(productRepository: ref.read(productRepositoryProvider)),
);

class AddProductUseCase {
  final ProductRepository productRepository;

  AddProductUseCase({required this.productRepository});

  Future<Either<Failure, bool>> call(ProductEntity productEntity) async {
    return await productRepository.addProduct(productEntity);
  }
}
