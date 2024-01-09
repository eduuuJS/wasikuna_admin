import 'dart:io';

class AttachmentFilePost {
  final String id;
  final String name;
  final String path;
  final AttachmentType type;
  final File file;

  AttachmentFilePost({
    required this.id,
    required this.name,
    required this.path,
    required this.type,
    required this.file,
  });

  String getContentType() {
    switch (type) {
      case AttachmentType.image:
        return 'image';
      case AttachmentType.video:
        return 'video';
      case AttachmentType.audio:
        return 'audio';
      case AttachmentType.document:
        return 'application';
      default:
        return '';
    }
  }
}

enum AttachmentType {
  image,
  video,
  audio,
  document,
  other,
}

AttachmentType getAttachmentType(File file) {
  String extensionFile = file.path.split('.').last.toLowerCase();
  print(extensionFile);
  switch (extensionFile) {
    case 'jpg':
    case 'jpeg':
    case 'png':
      return AttachmentType.image;
    case 'mp4':
    case 'mov':
      return AttachmentType.video;
    case 'mp3':
    case 'wav':
    case 'mpeg':
      return AttachmentType.audio;
    case 'pdf':
      return AttachmentType.document;
    default:
      return AttachmentType.other;
  }
}

String getNameFile(String root) {
  List<String> parts = root.split(Platform.pathSeparator);
  return parts.last;
}
