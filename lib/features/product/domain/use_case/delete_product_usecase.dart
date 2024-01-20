import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_shop/core/failure/failure.dart';
import 'package:meat_shop/features/product/domain/repository/product_repository.dart';

final deleteProductUseCaseProvider = Provider.autoDispose<DeleteProductUseCase>(
    (ref) => DeleteProductUseCase(
        productRepository: ref.read(productRepositoryProvider)));

class DeleteProductUseCase {
  final ProductRepository productRepository;

  DeleteProductUseCase({required this.productRepository});

  Future<Either<Failure, bool>> deleteProduct(String id) async {
    return await productRepository.deleteProduct(id);
  }
}
