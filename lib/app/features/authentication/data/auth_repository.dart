import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wasikuna_admin/app/shared/domain/response_mutation_domain.dart';
import 'package:wasikuna_admin/core/network/dio_client.dart';
import 'package:wasikuna_admin/core/utils/dependency_injection.dart';

part 'auth_repository.g.dart';

abstract class IAuthRepository {
  Future<ResponseMutationDomain<String>> doAuth(
      String userName, String password);
}

class AuthRepository implements IAuthRepository {
  final _dioClient = sl<DioClient>();

  @override
  Future<ResponseMutationDomain<String>> doAuth(
      String userName, String password) async {
    try {
      final response = await _dioClient.post(path: "/api/auth/login", bodyRaw: {
        "username": userName,
        "password": password,
      });
      final status = response.statusCode == 201;
      return ResponseMutationDomain(
        message: status ? "Bienvenido" : response.data["message"],
        success: status,
        data: status ? response.data : null,
      );
    } catch (e) {
      return ResponseMutationDomain(
        message: "Ups! Algo salió mal, intenta nuevamente",
        success: false,
      );
    }
  }
}

@riverpod
IAuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository();
}
