import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_shop/config/constants/api_endpoints.dart';
import 'package:meat_shop/core/failure/failure.dart';
import 'package:meat_shop/core/network/http_service.dart';
import 'package:meat_shop/features/product/data/dto/get_all_product_dto.dart';
import 'package:meat_shop/features/product/data/model/product_api_model.dart';
import 'package:meat_shop/features/product/domain/entity/product_entity.dart';

final productRemoteDataSourceProvider =
    Provider.autoDispose<ProductRemoteDataSource>(
  (ref) => ProductRemoteDataSource(
    dio: ref.read(httpServiceProvider),
  ),
);

class ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSource({required this.dio});

    //todo: add product
  // Future<Either<Failure, bool>> addProduct(ProductEntity product) async {
  //   try {
  //     ProductAPIModel productAPIModel = ProductAPIModel.fromEntity(product);
  //     var response = await dio.post(
  //       ApiEndpoints.createProduct,
  //       data: ProductAPIModel.toJson(),
  //     );
  //     if (response.statusCode == 201) {
  //       return const Right(true);
  //     } else {
  //       return Left(Failure(
  //         error: response.statusMessage.toString(),
  //         statusCode: response.statusCode.toString(),
  //       ));
  //     }
  //   } on DioException catch (e) {
  //     return Left(Failure(error: e.response?.data['message']));
  //   }
  // }

  //todo: get all products
  Future<Either<Failure, List<ProductEntity>>> getAllProduct(int page) async {
    try {
      var response = await dio.get(ApiEndpoints.getAllProduct,
       queryParameters: {
        "_page": page,
        "_limit": ApiEndpoints.limitPage,
      });
    
      if (response.statusCode == 200) {
        //* Convert ProductAPIModel to ProductEntity
        GetAllProductDTO productAddDTO = GetAllProductDTO.fromJson(response.data);
        List<ProductEntity> productList = productAddDTO.products
            .map((product) => ProductAPIModel.toEntity(product))
            .toList();

        return Right(productList);
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(Failure(error: e.response?.data['message']));
    }
  }


// todo: delete product
  // Future<Either<Failure, bool>> deleteProduct(String productId) async {
  //   try {
  //     Response response = await dio.delete(ApiEndpoints.deleteProduct + productId,
  //         options: Options(headers: {
  //           "Authorization": "Bearer ${ApiEndpoints.token}",
  //         }));
  //     if (response.statusCode == 200) {
  //       return const Right(true);
  //     } else {
  //       return Left(
  //         Failure(
  //             error: response.data['message'],
  //             statusCode: response.statusCode.toString()),
  //       );
  //     }
  //   } on DioException catch (e) {
  //     return Left(Failure(error: e.response?.data['message']));
  //   }
  // }
}
