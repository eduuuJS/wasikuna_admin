import 'dart:io';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:wasikuna_admin/app/features/post/data/repository/post_repository.dart';
import 'package:wasikuna_admin/app/features/post/domain/attachment_file_post.dart';
import 'package:wasikuna_admin/app/shared/domain/response_mutation_domain.dart';
part 'create_post_controller.g.dart';

@riverpod
class FileListCreatePost extends _$FileListCreatePost {
  @override
  List<AttachmentFilePost> build() {
    return [];
  }

  void addFile(File file) {
    state.add(AttachmentFilePost(
      id: const Uuid().v4(),
      name: getNameFile(file.path.split('/').last),
      path: file.path,
      file: file,
      type: getAttachmentType(file),
    ));
    state = state.toList();
  }

  void removeFile(String id) {
    state.removeWhere((element) => element.id == id);
    state = state.toList();
  }
}

@riverpod
class CreatePostController extends _$CreatePostController {
  TextEditingController ctrlTitle = TextEditingController();
  TextEditingController ctrlContent = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void build() {
    return;
  }

  Future<ResponseMutationDomain> createPost() async {
    final repository = ref.watch(postRepositoryProvider);
    return await repository.createPost(ctrlTitle.text, ctrlContent.text,
        ref.watch(fileListCreatePostProvider));
  }
}
