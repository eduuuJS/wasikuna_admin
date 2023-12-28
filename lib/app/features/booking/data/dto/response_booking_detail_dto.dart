import 'package:wasikuna_admin/app/features/booking/domain/booking_detail_domain.dart';
import 'package:wasikuna_admin/core/utils/constants.dart';
import 'package:wasikuna_admin/core/utils/parser.dart';

class ResponseBookingDetailDto {
  int? id;
  int? userId;
  String? userName;
  String? userPhoto;
  String? reservationStatus;
  String? roomName;
  String? roomStarHour;
  String? roomEndHour;
  int? roomForum;
  String? roomImageDefault;
  List<String>? roomImages;
  List<String>? reservationPayments;
  String? reservationDate;
  String? reservationPrice;
  String? reservationWarranty;
  String? reservationTotal;

  ResponseBookingDetailDto({
    this.id,
    this.userId,
    this.userName,
    this.userPhoto,
    this.reservationStatus,
    this.roomName,
    this.roomStarHour,
    this.roomEndHour,
    this.roomForum,
    this.roomImageDefault,
    this.roomImages,
    this.reservationPayments,
    this.reservationDate,
    this.reservationPrice,
    this.reservationWarranty,
    this.reservationTotal,
  });

  factory ResponseBookingDetailDto.fromJson(Map<String, dynamic> json) =>
      ResponseBookingDetailDto(
        id: json["id"],
        userId: json["user_id"],
        userName: json["user_name"],
        userPhoto: json["user_photo"],
        reservationStatus: json["reservation_status"],
        roomName: json["room_name"],
        roomStarHour: json["room_star_hour"],
        roomEndHour: json["room_end_hour"],
        roomForum: json["room_forum"],
        roomImageDefault: json["room_image_default"],
        roomImages: json["room_images"] == null
            ? []
            : List<String>.from(json["room_images"]!.map((x) => x)),
        reservationPayments: json["reservation_payments"] == null
            ? []
            : List<String>.from(json["reservation_payments"]!.map((x) => x)),
        reservationDate: json["reservation_date"],
        reservationPrice: json["reservation_price"],
        reservationWarranty: json["reservation_warranty"],
        reservationTotal: json["reservation_total"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "user_name": userName,
        "user_photo": userPhoto,
        "reservation_status": reservationStatus,
        "room_name": roomName,
        "room_star_hour": roomStarHour,
        "room_end_hour": roomEndHour,
        "room_forum": roomForum,
        "room_image_default": roomImageDefault,
        "room_images": roomImages == null
            ? []
            : List<dynamic>.from(roomImages!.map((x) => x)),
        "reservation_payments": reservationPayments == null
            ? []
            : List<dynamic>.from(reservationPayments!.map((x) => x)),
        "reservation_date": reservationDate,
        "reservation_price": reservationPrice,
        "reservation_warranty": reservationWarranty,
        "reservation_total": reservationTotal,
      };

  BookingDetailDomain toDomain() => BookingDetailDomain(
        idBooking: "$id",
        nameArea: roomName!,
        hrefArea: (roomImageDefault ?? "").replaceAll(localhost, myIP),
        openTime: Parser.timeToStringFormat12(roomStarHour ?? ""),
        closeTime: Parser.timeToStringFormat12(roomEndHour ?? ""),
        qualificationArea: "4.5",
        capacityArea: "$roomForum",
        dateBooking: reservationDate!,
        coastArea: reservationPrice!,
        warranty: reservationWarranty!,
        imagesPaymentBooking: reservationPayments!,
      );
}
