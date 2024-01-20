

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_shop/config/constants/api_endpoints.dart';
import 'package:meat_shop/core/failure/failure.dart';
import 'package:meat_shop/core/shared_prefs/user_shared_prefs.dart';
import 'package:meat_shop/features/auth/domain/entity/auth_entity.dart';
import 'package:meat_shop/features/auth/domain/repository/auth_repository.dart';


final authUseCaseProvider = Provider.autoDispose<AuthUseCase>((ref) => AuthUseCase( ref.read(authRepositoryProvider), ref.read(userSharedPrefsProvider)));
class AuthUseCase{
  final AuthRepository _authRepository;
  final UserSharedPrefs userSharedPrefs;


  AuthUseCase(
   this._authRepository,
    this.userSharedPrefs
  );


  Future<Either<Failure,bool>> addUser(AuthEntity user) async{
    return await _authRepository.register(user);
    
  }

   Future<Either<Failure, bool>> login(
    String username,
    String password,
  ) async {

    return await _authRepository.login(username, password);

    
    // //* call the repo to perform login
    // final result =await _authRepository.login(username, password);

    // //* if login success,
    // if(result.isRight()){
    //   //* save user token to shared preferences
    //   await userSharedPrefs.setUserToken(ApiEndpoints.token);
    // }
    // return result;
  }
}