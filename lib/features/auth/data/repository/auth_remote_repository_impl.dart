

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_shop/core/failure/failure.dart';
import 'package:meat_shop/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:meat_shop/features/auth/domain/entity/auth_entity.dart';
import 'package:meat_shop/features/auth/domain/repository/auth_repository.dart';


final authRemoteRepositoryProvider = Provider.autoDispose<AuthREemoteRepositoryImpl>((ref) => 
 AuthREemoteRepositoryImpl(authRemoteDataSource: ref.read(authRemoteDataSourceProvider)) 
);

class AuthREemoteRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource authRemoteDataSource;

  AuthREemoteRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, bool>> register(AuthEntity user) {
    // TODO: implement register
    return authRemoteDataSource.registerUser(user);
    // throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, bool>> login(String username, String password) {
    // TODO: implement login
    return authRemoteDataSource.login(username,password);
  }

}