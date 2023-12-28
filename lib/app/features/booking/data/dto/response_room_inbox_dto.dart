import 'package:wasikuna_admin/app/features/booking/domain/common_area_domain.dart';
import 'package:wasikuna_admin/core/utils/constants.dart';
import 'package:wasikuna_admin/core/utils/parser.dart';

class ResponseRoomInboxDto {
  List<RoomInbox>? roomInbox;

  ResponseRoomInboxDto({
    this.roomInbox,
  });

  factory ResponseRoomInboxDto.fromJson(Map<String, dynamic> json) =>
      ResponseRoomInboxDto(
        roomInbox: json["roomInbox"] == null
            ? []
            : List<RoomInbox>.from(
                json["roomInbox"]!.map((x) => RoomInbox.fromJson(x))),
      );

  List<CommonAreaDomain> toDomain() =>
      roomInbox!.map((e) => e.toDomain()).toList();
}

class RoomInbox {
  int? id;
  String? name;
  String? price;
  int? forum;
  bool? isAvailable;
  String? starHour;
  String? endHour;
  String? imageDefault;
  List<String>? images;

  RoomInbox({
    this.id,
    this.name,
    this.price,
    this.forum,
    this.isAvailable,
    this.starHour,
    this.endHour,
    this.imageDefault,
    this.images,
  });

  factory RoomInbox.fromJson(Map<String, dynamic> json) => RoomInbox(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        forum: json["forum"],
        isAvailable: json["is_available"],
        starHour: json["star_hour"],
        endHour: json["end_hour"],
        imageDefault: json["image_default"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
      );

  CommonAreaDomain toDomain() => CommonAreaDomain(
        idArea: "$id",
        nameArea: name ?? "",
        startTime: Parser.timeToStringFormat12(starHour ?? ""),
        closeTime: Parser.timeToStringFormat12(endHour ?? ""),
        capacity: "$forum",
        qualification: "4.5",
        coast: Parser.stringNumericFormat(price ?? ""),
        urlPhoto: (imageDefault ?? "").replaceAll(localhost, myIP),
        images:
            (images ?? []).map((e) => e.replaceAll(localhost, myIP)).toList(),
      );
}
