class RequestCreatePostDto {
  String? title;
  String? content;
  List<String>? attachments;

  RequestCreatePostDto({
    this.title,
    this.content,
    this.attachments,
  });

  factory RequestCreatePostDto.fromJson(Map<String, dynamic> json) =>
      RequestCreatePostDto(
        title: json["title"],
        content: json["content"],
        attachments: json["attachments"] == null
            ? []
            : List<String>.from(json["attachments"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "attachments": attachments == null
            ? []
            : List<dynamic>.from(attachments!.map((x) => x)),
      };
}
