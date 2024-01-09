

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_shop/core/failure/failure.dart';
import 'package:meat_shop/features/auth/domain/entity/auth_entity.dart';
import 'package:meat_shop/features/auth/domain/repository/auth_repository.dart';


final authUseCaseProvider = Provider.autoDispose<AuthUseCase>((ref) => AuthUseCase(authRepository: ref.read(authRepositoryProvider)));
class AuthUseCase{
  final AuthRepository authRepository;

  AuthUseCase({
    required this.authRepository
  });


  Future<Either<Failure,bool>> addUser(AuthEntity user) async{
    return await authRepository.register(user);
    
  }
}