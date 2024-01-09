import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http_parser/src/media_type.dart';
import 'package:wasikuna_admin/app/features/post/data/dto/request_create_post_dto.dart';
import 'package:wasikuna_admin/app/features/post/domain/attachment_file_post.dart';
import 'package:wasikuna_admin/app/shared/data/dtos/response_attachment_ids_dto.dart';
import 'package:wasikuna_admin/app/shared/domain/response_mutation_domain.dart';
import 'package:wasikuna_admin/core/network/dio_client.dart';
import 'package:wasikuna_admin/core/utils/dependency_injection.dart';
part 'post_repository.g.dart';

abstract class IPostRepository {
  Future<ResponseMutationDomain<bool>> createPost(
      String title, String content, List<AttachmentFilePost> files);
}

class PostRepository implements IPostRepository {
  final _dioClient = sl<DioClient>();

  Future<List<String>> _postImportAttachement(
      List<AttachmentFilePost> files) async {
    try {
      List<MultipartFile> newFiles = [];
      for (var fileAttachment in files) {
        final file = fileAttachment.file;
        newFiles.add(await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
          contentType: MediaType(
              fileAttachment.getContentType(), file.path.split('.').last),
        ));
      }
      FormData formData = FormData.fromMap(
        {
          "files": newFiles,
        },
      );
      final response = await _dioClient.post(
          path: '/api/attachments/publication',
          contentType: 'multipart/form-data',
          formData: formData);
      return ResponseAttachmentIdsDto.fromJson(response.data).ids!;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<ResponseMutationDomain<bool>> createPost(
      String title, String content, List<AttachmentFilePost> files) async {
    List<String> ids = [];
    try {
      if (files.isNotEmpty) {
        ids = await _postImportAttachement(files);
      }
      final response = await _dioClient.post(
          path: "/api/publication",
          bodyRaw: RequestCreatePostDto(
                  title: title, content: content, attachments: ids)
              .toJson());
      final status = response.statusCode == 201;
      return ResponseMutationDomain(
        message: status ? "Publicación registrada" : response.data["message"],
        success: status,
        data: status ? true : false,
      );
    } catch (e) {
      return ResponseMutationDomain(
        message: e.toString(),
        success: false,
      );
    }
  }
}

@riverpod
IPostRepository postRepository(PostRepositoryRef ref) {
  return PostRepository();
}
