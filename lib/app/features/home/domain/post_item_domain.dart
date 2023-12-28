class PostItemNewsDomain {
  String id;
  String day;
  String month;
  String title;
  String timeAgo;
  String contentText;
  String publisher;
  String rolPublisher;
  String urlPhotoPublisher;
  bool hasMediaContent;
  List<FilePostItemNewsDomain> files;

  PostItemNewsDomain({
    required this.id,
    required this.day,
    required this.month,
    required this.title,
    required this.timeAgo,
    required this.contentText,
    required this.publisher,
    required this.rolPublisher,
    required this.urlPhotoPublisher,
    required this.hasMediaContent,
    required this.files,
  });
}

class FilePostItemNewsDomain {
  String url;
  TypeFilePostItemNewsDomain type;

  FilePostItemNewsDomain({
    required this.url,
    required this.type,
  });
}

enum TypeFilePostItemNewsDomain {
  image,
  video,
  audio,
  pdf,
  other,
}
