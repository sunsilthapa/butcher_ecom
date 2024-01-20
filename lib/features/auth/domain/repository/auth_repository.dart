



import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_shop/core/failure/failure.dart';
import 'package:meat_shop/features/auth/data/repository/auth_remote_repository_impl.dart';
import 'package:meat_shop/features/auth/domain/entity/auth_entity.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) => ref.read(authRemoteRepositoryProvider));

abstract class AuthRepository {
  Future<Either<Failure, bool>> register(AuthEntity user);
  Future<Either<Failure, bool>> login(String username, String password);
}