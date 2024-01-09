class ResponseAttachmentIdsDto {
  List<String>? ids;

  ResponseAttachmentIdsDto({
    this.ids,
  });

  factory ResponseAttachmentIdsDto.fromJson(Map<String, dynamic> json) =>
      ResponseAttachmentIdsDto(
        ids: json["ids"] == null
            ? []
            : List<String>.from(json["ids"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "ids": ids == null ? [] : List<dynamic>.from(ids!.map((x) => x)),
      };
}
