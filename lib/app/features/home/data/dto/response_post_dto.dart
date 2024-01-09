import 'package:uuid/uuid.dart';
import 'package:wasikuna_admin/app/features/home/domain/post_item_domain.dart';
import 'package:wasikuna_admin/core/utils/format_image.dart';
import 'package:wasikuna_admin/core/utils/parser.dart';

class ResponsePostDto {
  int? count;
  int? pageIndex;
  int? pageSize;
  List<DataPost>? dataPosts;
  int? pageCount;

  ResponsePostDto({
    this.count,
    this.pageIndex,
    this.pageSize,
    this.dataPosts,
    this.pageCount,
  });

  factory ResponsePostDto.fromJson(Map<String, dynamic> json) =>
      ResponsePostDto(
        count: json["count"],
        pageIndex: json["pageIndex"],
        pageSize: json["pageSize"],
        dataPosts: json["data"] == null
            ? []
            : List<DataPost>.from(
                json["data"]!.map((x) => DataPost.fromJson(x))),
        pageCount: json["pageCount"],
      );

  List<PostItemNewsDomain> toDomain() {
    final result = dataPosts!.map((e) => e.toDomain()).toList();
    return result;
  }
}

class DataPost {
  List<String>? attachmentsImages;
  List<String>? attachmentsVideos;
  List<String>? attachmentsAudios;
  List<String>? attachmentsPdfs;
  List<String>? attachmentsOthers;
  int? id;
  String? userName;
  String? createdAt;
  String? title;
  String? content;

  DataPost({
    this.attachmentsImages,
    this.attachmentsVideos,
    this.attachmentsAudios,
    this.attachmentsPdfs,
    this.attachmentsOthers,
    this.id,
    this.userName,
    this.createdAt,
    this.title,
    this.content,
  });

  factory DataPost.fromJson(Map<String, dynamic> json) => DataPost(
        attachmentsImages: json["attachments_images"] == null
            ? []
            : List<String>.from(json["attachments_images"]!.map((x) => x)),
        attachmentsVideos: json["attachments_videos"] == null
            ? []
            : List<String>.from(json["attachments_videos"]!.map((x) => x)),
        attachmentsAudios: json["attachments_audios"] == null
            ? []
            : List<String>.from(json["attachments_audios"]!.map((x) => x)),
        attachmentsPdfs: json["attachments_pdfs"] == null
            ? []
            : List<String>.from(json["attachments_pdfs"]!.map((x) => x)),
        attachmentsOthers: json["attachments_others"] == null
            ? []
            : List<String>.from(json["attachments_others"]!.map((x) => x)),
        id: json["id"],
        userName: json["user_name"],
        createdAt: json["created_at"],
        title: json["title"],
        content: json["content"],
      );

  PostItemNewsDomain toDomain() {
    final myFiles = generateFilesDomain();
    return PostItemNewsDomain(
      id: "$id",
      day: Parser.getDayString(createdAt ?? ""),
      month: Parser.getMonthString(createdAt ?? ""),
      title: title ?? "",
      timeAgo: Parser.getTimeAgo(createdAt ?? ""),
      contentText: content!,
      publisher: userName!,
      rolPublisher: "Administrador",
      urlPhotoPublisher:
          'https://static.vecteezy.com/system/resources/previews/014/362/759/non_2x/system-administrator-icon-cartoon-computer-server-vector.jpg',
      hasMediaContent: myFiles.isNotEmpty,
      files: myFiles,
    );
  }

  List<FilePostItemNewsDomain> generateFilesDomain() {
    final result = <FilePostItemNewsDomain>[];
    if (attachmentsImages!.isNotEmpty) {
      result.addAll(attachmentsImages!
          .map((e) => FilePostItemNewsDomain(
              id: const Uuid().v4(),
              url: formatImage(e),
              type: TypeFilePostItemNewsDomain.image))
          .toList());
    }
    if (attachmentsVideos!.isNotEmpty) {
      result.addAll(attachmentsVideos!
          .map((e) => FilePostItemNewsDomain(
              id: const Uuid().v4(),
              url: formatImage(e),
              type: TypeFilePostItemNewsDomain.video))
          .toList());
    }
    if (attachmentsAudios!.isNotEmpty) {
      result.addAll(attachmentsAudios!
          .map((e) => FilePostItemNewsDomain(
              id: const Uuid().v4(),
              url: formatImage(e),
              type: TypeFilePostItemNewsDomain.audio))
          .toList());
    }
    if (attachmentsPdfs!.isNotEmpty) {
      result.addAll(attachmentsPdfs!
          .map((e) => FilePostItemNewsDomain(
              id: const Uuid().v4(),
              url: formatImage(e),
              type: TypeFilePostItemNewsDomain.pdf))
          .toList());
    }
    if (attachmentsOthers!.isNotEmpty) {
      result.addAll(attachmentsOthers!
          .map((e) => FilePostItemNewsDomain(
              id: const Uuid().v4(),
              url: formatImage(e),
              type: TypeFilePostItemNewsDomain.other))
          .toList());
    }
    return result;
  }
}
