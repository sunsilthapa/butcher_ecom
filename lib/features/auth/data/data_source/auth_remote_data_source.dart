import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_shop/config/constants/api_endpoints.dart';
import 'package:meat_shop/core/failure/failure.dart';
import 'package:meat_shop/core/network/http_service.dart';
import 'package:meat_shop/core/shared_prefs/user_shared_prefs.dart';
import 'package:meat_shop/features/auth/data/model/auth_api_model.dart';
import 'package:meat_shop/features/auth/domain/entity/auth_entity.dart';


final authRemoteDataSourceProvider = Provider.autoDispose<AuthRemoteDataSource>((ref) => AuthRemoteDataSource(ref.read(httpServiceProvider), ref.read(userSharedPrefsProvider)));
class AuthRemoteDataSource {
  final Dio dio;
  final UserSharedPrefs userSharedPrefs;

  AuthRemoteDataSource( this.dio, this.userSharedPrefs);


  Future<Either<Failure, bool>> registerUser(AuthEntity student) async {
    try {
      AuthAPIModel apiModel = AuthAPIModel.fromEntity(student);
      Response response = await dio.post(
        ApiEndpoints.register,
        data: {
          "firstName": apiModel.firstName,
          "lastName": apiModel.lastName,
          "email": apiModel.email,
          "password": apiModel.password,
        },

      );
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }


    // Adding a login function to AuthRemoteDataSource.dart
Future<Either<Failure, bool>> login(String username, String password) async {
  try {
    Response response = await dio.post(
      ApiEndpoints.login,
      data: {
        "username": username,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      // Handle successful login response, if needed
      // You might want to store tokens or user information
      ApiEndpoints.token = response.data["token"];
      await userSharedPrefs.setUserToken(ApiEndpoints.token);
      return const Right(true);
    } else {
      return Left(
        Failure(
          error: response.data["message"],
          statusCode: response.statusCode.toString(),
        ),
      );
    }
  } on DioException catch (e) {
    return Left(
      Failure(
        error: e.error.toString(),
        statusCode: e.response?.statusCode.toString() ?? '0',
      ),
    );
  }
}

}
