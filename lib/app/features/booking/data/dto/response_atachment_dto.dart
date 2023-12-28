class ResponseAtachmentIdsDto {
  List<String>? ids;
  List<String>? urls;

  ResponseAtachmentIdsDto({
    this.ids,
    this.urls,
  });

  factory ResponseAtachmentIdsDto.fromJson(Map<String, dynamic> json) =>
      ResponseAtachmentIdsDto(
        ids: json["ids"] == null
            ? []
            : List<String>.from(json["ids"]!.map((x) => x)),
        urls: json["urls"] == null
            ? []
            : List<String>.from(json["urls"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "ids": ids == null ? [] : List<dynamic>.from(ids!.map((x) => x)),
        "urls": urls == null ? [] : List<dynamic>.from(urls!.map((x) => x)),
      };
}
