import 'package:wasikuna_admin/app/features/booking/domain/area_detail_domain.dart';
import 'package:wasikuna_admin/core/utils/constants.dart';
import 'package:wasikuna_admin/core/utils/parser.dart';

class ResponseAreaDetailDto {
  int? id;
  String? name;
  String? price;
  String? warranty;
  int? forum;
  bool? isAvailable;
  String? starHour;
  String? endHour;
  String? imageDefault;
  List<String>? images;

  ResponseAreaDetailDto({
    this.id,
    this.name,
    this.price,
    this.warranty,
    this.forum,
    this.isAvailable,
    this.starHour,
    this.endHour,
    this.imageDefault,
    this.images,
  });

  factory ResponseAreaDetailDto.fromJson(Map<String, dynamic> json) =>
      ResponseAreaDetailDto(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        warranty: json["warranty"],
        forum: json["forum"],
        isAvailable: json["is_available"],
        starHour: json["star_hour"],
        endHour: json["end_hour"],
        imageDefault: json["image_default"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
      );

  AreaDetailDomain toDomain() => AreaDetailDomain(
        idArea: "$id",
        nameArea: name ?? "",
        urlPhoto: (imageDefault ?? "").replaceAll(localhost, myIP),
        openTime: Parser.timeToStringFormat12(starHour ?? ""),
        closeTime: Parser.timeToStringFormat12(endHour ?? ""),
        capacity: "$forum",
        qualification: "4.5",
        coast: price ?? "",
        warranty: warranty ?? "",
        totalCoast: (double.parse(price ?? "0") + double.parse(warranty ?? "0"))
            .toString(),
      );
}
