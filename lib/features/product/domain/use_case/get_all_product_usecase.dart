import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_shop/core/failure/failure.dart';
import 'package:meat_shop/features/product/domain/entity/product_entity.dart';
import 'package:meat_shop/features/product/domain/repository/product_repository.dart';

final getAllProductUseCaseProvider = Provider<GetAllProductUseCase>(
  (ref) =>
      GetAllProductUseCase(productRepository: ref.read(productRepositoryProvider)),
);

class GetAllProductUseCase {
  final ProductRepository productRepository;

  GetAllProductUseCase({required this.productRepository});

  Future<Either<Failure, List<ProductEntity>>> getAllProduct(int page) async {
    return await productRepository.getAllProduct(page);
  }
}
