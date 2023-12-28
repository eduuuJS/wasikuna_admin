import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wasikuna_admin/app/features/authentication/data/auth_repository.dart';
import 'package:wasikuna_admin/app/shared/domain/response_mutation_domain.dart';

part 'auth_controller.g.dart';

@riverpod
class PrivateTextPasswordAuth extends _$PrivateTextPasswordAuth {
  @override
  bool build() {
    return true;
  }

  void switchState() {
    state = !state;
  }
}

@riverpod
class AuthController extends _$AuthController {
  @override
  void build() {}

  //TextEditingController
  final TextEditingController ctrlUser =
      TextEditingController(text: "76272866");
  final TextEditingController ctrlPassword =
      TextEditingController(text: "P@ssword1234_");

  //Functions
  Future<ResponseMutationDomain> doAuth() async {
    final response = await ref
        .watch(authRepositoryProvider)
        .doAuth(ctrlUser.text, ctrlPassword.text);
    return response;
  }
}
